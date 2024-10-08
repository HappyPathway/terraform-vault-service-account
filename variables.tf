variable "project_id" {
  description = "The ID of the project in which to create the service account."
  type        = string
}

variable "vault_jwt_validation_service_account_id" {
  description = "The ID of the service account to create."
  type        = string
}

variable "vault_jwt_validation_service_account_display_name" {
  description = "The display name of the service account."
  type        = string
  default     = null
}

variable "iam_roles" {
  description = "A list of IAM roles to attach to the service account."
  type        = list(string)
  default     = []
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


variable "bind_project" {
  type    = bool
  default = true
}

variable "bound_projects" {
  type    = list(string)
  default = []
}

variable "policies" {
  type = map(string)
}

variable "rotate_key" {
  type    = bool
  default = false
}

variable "add_jwt_validotor_permissions" {
  type    = bool
  default = false
}

variable "create_service_account" {
  description = "Create a new service account or use an existing one."
  type        = bool
  default     = false
}

variable "allowed_service_accounts" {
  type    = list(string)
  default = []
}

variable "gcp_auth_type" {
  default = "iam"
  type    = string
}

variable "allow_gce_inference" {
  description = "Flag to allow GCE inference"
  type        = bool
  default     = false # or true, based on your decision
}

variable "max_jwt_exp" {
  description = "Maximum JWT expiration time in seconds"
  type        = number
  default     = 3600 # 1 hour
}

variable "bound_zones" {
  description = "List of zones to bind"
  type        = list(string)
  default     = []
}

variable "bound_regions" {
  description = "List of regions to bind"
  type        = list(string)
  default     = []
}

variable "bound_instance_groups" {
  description = "List of instance groups to bind"
  type        = list(string)
  default     = []
}

variable "bound_labels" {
  description = "Map of labels to bind"
  type        = list(string)
  default     = []
}
