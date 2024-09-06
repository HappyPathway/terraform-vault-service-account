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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.1.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.12.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.vault_gcp_sa_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.vault_gcp_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.vault_gcp_sa_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [time_rotating.key_rotation](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [vault_gcp_auth_backend.gcp](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend) | resource |
| [vault_gcp_auth_backend_role.gcp_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend_role) | resource |
| [vault_policy.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [google_service_account.vault_gcp_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bind_project"></a> [bind\_project](#input\_bind\_project) | n/a | `bool` | `true` | no |
| <a name="input_bound_projects"></a> [bound\_projects](#input\_bound\_projects) | n/a | `list(string)` | `[]` | no |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Create a new service account or use an existing one. | `bool` | `true` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | A list of IAM roles to attach to the service account. | `list(string)` | `[]` | no |
| <a name="input_key_rotation"></a> [key\_rotation](#input\_key\_rotation) | Rotate key ever N number of days | `string` | `7` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | `map(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which to create the service account. | `string` | n/a | yes |
| <a name="input_rotate_key"></a> [rotate\_key](#input\_rotate\_key) | n/a | `bool` | `false` | no |
| <a name="input_service_account_display_name"></a> [service\_account\_display\_name](#input\_service\_account\_display\_name) | The display name of the service account. | `string` | `null` | no |
| <a name="input_service_account_id"></a> [service\_account\_id](#input\_service\_account\_id) | The ID of the service account to create. | `string` | n/a | yes |
| <a name="input_vault_gcp_auth_path"></a> [vault\_gcp\_auth\_path](#input\_vault\_gcp\_auth\_path) | The path where the GCP auth backend will be mounted in Vault. | `string` | n/a | yes |
| <a name="input_vault_gcp_auth_role_name"></a> [vault\_gcp\_auth\_role\_name](#input\_vault\_gcp\_auth\_role\_name) | The name of the role to create in the GCP auth backend. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the created service account. |
| <a name="output_vault_gcp_auth_backend_path"></a> [vault\_gcp\_auth\_backend\_path](#output\_vault\_gcp\_auth\_backend\_path) | The path of the Vault GCP auth backend. |
<!-- END_TF_DOCS -->