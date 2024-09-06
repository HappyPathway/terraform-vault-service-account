terraform {
  required_providers {
    mycloud = {
      source  = "hashicorp/google"
      version = "~> 6.1.0"
    }
  }
}

locals {
  // Determine the service account to use based on the variable 'create_service_account'
  service_account = var.create_service_account ? one(google_service_account.vault_gcp_sa) : one(data.google_service_account).vault_gcp_sa
  // Extract the service account ID
  service_account_id = local.service_account.id
}

# Note: This requires the Terraform to be run regularly
resource "time_rotating" "key_rotation" {
  count         = var.rotate_key ? 1 : 0
  rotation_days = var.key_rotation
}

data "google_service_account" "vault_gcp_sa" {
  count      = var.create_service_account ? 0 : 1
  account_id = var.service_account_id
  project    = var.project_id
}

resource "google_service_account" "vault_gcp_sa" {
  count        = var.create_service_account ? 1 : 0
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = var.project_id
}

resource "google_service_account_key" "vault_gcp_sa_key" {
  // Use the service account ID from the local variable
  service_account_id = local.service_account_id
  // Use the last rotation time as a keeper to force recreation of the key
  keepers = var.rotate_key ? {
    last_rotation = one(time_rotating.key_rotation).rotation_rfc3339
  } : {}
}

resource "google_project_iam_member" "vault_gcp_sa_iam" {
  // Assign IAM roles to the service account
  for_each = var.create_service_account ? toset(var.iam_roles) : toset([])
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${local.service_account.email}"
}

resource "vault_gcp_auth_backend" "gcp" {
  // Configure the Vault GCP auth backend
  path        = var.vault_gcp_auth_path
  credentials = google_service_account_key.vault_gcp_sa_key.private_key
}

resource "vault_policy" "policy" {
  for_each = tomap(var.policies)
  name     = each.key
  policy   = file(each.value)
}

resource "vault_gcp_auth_backend_role" "gcp_role" {
  // Define a role for the Vault GCP auth backend
  backend                = vault_gcp_auth_backend.gcp.path
  role                   = var.vault_gcp_auth_role_name
  type                   = "iam"
  bound_service_accounts = [local.service_account.email]
  bound_projects         = var.bind_project ? concat(var.bound_projects, [var.project_id]) : null
  token_policies         = [for policy in vault_policy.policy : policy.name]
}
