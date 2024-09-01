variable "project_id" {
  description = "The ID of the project in which to create the service account."
  type        = string
}

variable "service_account_id" {
  description = "The ID of the service account to create."
  type        = string
}

variable "service_account_display_name" {
  description = "The display name of the service account."
  type        = string
}

variable "iam_roles" {
  description = "A list of IAM roles to attach to the service account."
  type        = list(string)
}

variable "vault_gcp_auth_path" {
  description = "The path where the GCP auth backend will be mounted in Vault."
  type        = string
}

variable "vault_gcp_auth_role_name" {
  description = "The name of the role to create in the GCP auth backend."
  type        = string
}

variable "key_rotation" {
  default     = 7
  type        = string
  description = "Rotate key ever N number of days"
}

variable "create_service_account" {
  description = "Create a new service account or use an existing one."
  type        = bool
  default     = true
}
