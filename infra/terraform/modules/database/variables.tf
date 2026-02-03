variable "name" {
  description = "Name of the PostgreSQL flexible server."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the database."
  type        = string
}

variable "location" {
  description = "Azure region for the database."
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL engine version."
  type        = string
  default     = "14"
}

variable "sku_name" {
  description = "SKU name for the flexible server."
  type        = string
}

variable "storage_mb" {
  description = "Storage size in MB."
  type        = number
}

variable "backup_retention_days" {
  description = "Backup retention period in days."
  type        = number
}

variable "admin_username" {
  description = "Administrator username."
  type        = string
}

variable "database_name" {
  description = "Default database name."
  type        = string
}

variable "delegated_subnet_id" {
  description = "Delegated subnet ID for private access."
  type        = string
}

variable "vnet_id" {
  description = "Virtual network ID for private DNS link."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
}
