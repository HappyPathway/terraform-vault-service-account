module "vault_gcp_auth" {
  source = "../"

  project_id                   = "your-project-id"
  region                       = "your-region"
  vault_address                = "https://vault.example.com"
  service_account_id           = "vault-gcp-sa"
  service_account_display_name = "Vault GCP Service Account"
  iam_roles = [
    "roles/iam.serviceAccountUser",
    "roles/storage.admin"
  ]
  vault_gcp_auth_path      = "auth/gcp"
  vault_gcp_auth_role_name = "my-role"
  vault_gcp_auth_bindings = {
    "type"     = "iam"
    "project"  = "your-project-id"
    "bindings" = "roles/iam.serviceAccountUser"
  }
}
