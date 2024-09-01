# terraform-vault-service-account
## locals Block
service_account: This local variable determines which service account to use based on the create_service_account variable. 
      If create_service_account is true, it uses the service account created by the google_service_account resource. 
      Otherwise, it uses an existing service account fetched by the data.google_service_account data source.
service_account_id: This local variable extracts the ID of the selected service account.
## Resource
time_rotating.key_rotation: This resource sets up a key rotation schedule, rotating the key every 30 days. This ensures that the service account key is regularly rotated for security purposes.
google_service_account_key.vault_gcp_sa_key: This resource creates a new key for the service account. The keepers 
      block ensures that the key is recreated whenever the last_rotation time changes, 
      which is controlled by the time_rotating resource.
      
google_project_iam_member.vault_gcp_sa_iam: This resource assigns IAM roles to the service account. It iterates over the iam_roles 
      variable and assigns each role to the service account in the specified project.

vault_gcp_auth_backend.gcp: This resource configures the Vault GCP authentication backend. It uses the private key of the service 
      account created by the google_service_account_key resource.

vault_gcp_auth_backend_role.gcp_role: This resource defines a role for the Vault GCP authentication backend. It specifies the backend 
    path, role name, type, and binds the role to specific service accounts and projects.

## Summary
The code sets up a service account and rotates its key every 30 days.
It assigns IAM roles to the service account.
It configures the Vault GCP authentication backend using the service account's private key.
It defines a role for the Vault GCP authentication backend, binding it to specific service accounts and projects.
