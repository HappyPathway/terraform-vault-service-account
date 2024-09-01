resource "google_service_account" "vault_gcp_sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

# note this requires the terraform to be run regularly
resource "time_rotating" "key_rotation" {
  rotation_days = 30
}

resource "google_service_account_key" "vault_gcp_sa_key" {
  service_account_id = google_service_account.vault_gcp_sa.id
  keepers = {
    last_rotation = time_rotating.key_rotation.rotation_rfc3339
  }
}

resource "google_project_iam_member" "vault_gcp_sa_iam" {
  for_each = toset(var.iam_roles)
  project  = var.project_id
  role     = each.value
  member   = "serviceAccount:${google_service_account.vault_gcp_sa.email}"
}

resource "vault_gcp_auth_backend" "gcp" {
  path        = var.vault_gcp_auth_path
  credentials = google_service_account_key.vault_gcp_sa_key.private_key
}

resource "vault_gcp_auth_backend_role" "gcp_role" {
  backend                = vault_gcp_auth_backend.gcp.path
  role                   = var.vault_gcp_auth_role_name
  type                   = "iam"
  bound_service_accounts = [google_service_account.vault_gcp_sa.email]
  bound_projects         = ["test"]
}

