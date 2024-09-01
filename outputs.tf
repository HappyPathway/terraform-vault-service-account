output "service_account_email" {
  description = "The email of the created service account."
  value       = google_service_account.vault_gcp_sa.email
}

output "vault_gcp_auth_backend_path" {
  description = "The path of the Vault GCP auth backend."
  value       = vault_gcp_auth_backend.gcp.path
}
