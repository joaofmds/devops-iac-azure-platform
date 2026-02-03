variable "name" {
  description = "Key Vault name."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Map of secrets to create in Key Vault. Key is the secret name, value is the secret value."
  type        = map(string)
  default     = {}
}

variable "access_policies" {
  description = "Map of access policies. Key is a unique identifier, value contains tenant_id (optional, defaults to current), object_id, and secret_permissions."
  type = map(object({
    tenant_id         = optional(string)
    object_id         = string
    secret_permissions = list(string)
  }))
  default = {}
}
