
[![Terraform Validation](https://github.com/HappyPathway/terraform-vault-service-account/actions/workflows/terraform.yaml/badge.svg)](https://github.com/HappyPathway/terraform-vault-service-account/actions/workflows/terraform.yaml)

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
| [google_project_iam_custom_role.vault_gcp_validator_validator_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.vault_gcp_validator_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.vault_gcp_validator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.vault_gcp_validator_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |
| [time_rotating.key_rotation](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [vault_gcp_auth_backend.gcp](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend) | resource |
| [vault_gcp_auth_backend_role.gcp_gce_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend_role) | resource |
| [vault_gcp_auth_backend_role.gcp_iam_role](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/gcp_auth_backend_role) | resource |
| [vault_policy.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [google_service_account.vault_gcp_validator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_jwt_validotor_permissions"></a> [add\_jwt\_validotor\_permissions](#input\_add\_jwt\_validotor\_permissions) | n/a | `bool` | `false` | no |
| <a name="input_allow_gce_inference"></a> [allow\_gce\_inference](#input\_allow\_gce\_inference) | Flag to allow GCE inference | `bool` | `false` | no |
| <a name="input_allowed_service_accounts"></a> [allowed\_service\_accounts](#input\_allowed\_service\_accounts) | n/a | `list(string)` | `[]` | no |
| <a name="input_bind_project"></a> [bind\_project](#input\_bind\_project) | n/a | `bool` | `true` | no |
| <a name="input_bound_instance_groups"></a> [bound\_instance\_groups](#input\_bound\_instance\_groups) | List of instance groups to bind | `list(string)` | `[]` | no |
| <a name="input_bound_labels"></a> [bound\_labels](#input\_bound\_labels) | Map of labels to bind | `list(string)` | `[]` | no |
| <a name="input_bound_projects"></a> [bound\_projects](#input\_bound\_projects) | n/a | `list(string)` | `[]` | no |
| <a name="input_bound_regions"></a> [bound\_regions](#input\_bound\_regions) | List of regions to bind | `list(string)` | `[]` | no |
| <a name="input_bound_zones"></a> [bound\_zones](#input\_bound\_zones) | List of zones to bind | `list(string)` | `[]` | no |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | Create a new service account or use an existing one. | `bool` | `false` | no |
| <a name="input_gcp_auth_type"></a> [gcp\_auth\_type](#input\_gcp\_auth\_type) | n/a | `string` | `"iam"` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | A list of IAM roles to attach to the service account. | `list(string)` | `[]` | no |
| <a name="input_key_rotation"></a> [key\_rotation](#input\_key\_rotation) | Rotate key ever N number of days | `string` | `7` | no |
| <a name="input_max_jwt_exp"></a> [max\_jwt\_exp](#input\_max\_jwt\_exp) | Maximum JWT expiration time in seconds | `number` | `3600` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | `map(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which to create the service account. | `string` | n/a | yes |
| <a name="input_rotate_key"></a> [rotate\_key](#input\_rotate\_key) | n/a | `bool` | `false` | no |
| <a name="input_vault_gcp_auth_path"></a> [vault\_gcp\_auth\_path](#input\_vault\_gcp\_auth\_path) | The path where the GCP auth backend will be mounted in Vault. | `string` | n/a | yes |
| <a name="input_vault_gcp_auth_role_name"></a> [vault\_gcp\_auth\_role\_name](#input\_vault\_gcp\_auth\_role\_name) | The name of the role to create in the GCP auth backend. | `string` | n/a | yes |
| <a name="input_vault_jwt_validation_service_account_display_name"></a> [vault\_jwt\_validation\_service\_account\_display\_name](#input\_vault\_jwt\_validation\_service\_account\_display\_name) | The display name of the service account. | `string` | `null` | no |
| <a name="input_vault_jwt_validation_service_account_id"></a> [vault\_jwt\_validation\_service\_account\_id](#input\_vault\_jwt\_validation\_service\_account\_id) | The ID of the service account to create. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the created service account. |
| <a name="output_vault_gcp_auth_backend_path"></a> [vault\_gcp\_auth\_backend\_path](#output\_vault\_gcp\_auth\_backend\_path) | The path of the Vault GCP auth backend. |
<!-- END_TF_DOCS -->