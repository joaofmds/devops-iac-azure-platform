variable "project_name" {
  description = "Project name prefix."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Base tags."
  type        = map(string)
}

variable "vnet_address_space" {
  description = "VNet address space."
  type        = list(string)
}

variable "subnet_frontend_cidr" {
  description = "Frontend subnet CIDR."
  type        = string
}

variable "subnet_backend_cidr" {
  description = "Backend subnet CIDR."
  type        = string
}

variable "subnet_database_cidr" {
  description = "Database subnet CIDR."
  type        = string
}

variable "storage_account_name" {
  description = "Storage account name."
  type        = string
}

variable "storage_retention_days" {
  description = "Retention days for logs and static blobs."
  type        = number
}

variable "acr_name" {
  description = "Container Registry name."
  type        = string
}

variable "acr_sku" {
  description = "Container Registry SKU."
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault name."
  type        = string
}

variable "postgres_server_name" {
  description = "PostgreSQL server name."
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL version."
  type        = string
}

variable "postgres_sku_name" {
  description = "PostgreSQL SKU name."
  type        = string
}

variable "postgres_storage_mb" {
  description = "PostgreSQL storage size in MB."
  type        = number
}

variable "postgres_backup_retention_days" {
  description = "Backup retention days."
  type        = number
}

variable "postgres_admin_username" {
  description = "PostgreSQL admin username."
  type        = string
}

variable "postgres_database_name" {
  description = "PostgreSQL database name."
  type        = string
}

variable "backend_service_plan_sku" {
  description = "Backend App Service plan SKU."
  type        = string
}

variable "frontend_service_plan_sku" {
  description = "Frontend App Service plan SKU."
  type        = string
}

variable "backend_node_version" {
  description = "Node version for backend."
  type        = string
  default     = null
}

variable "backend_python_version" {
  description = "Python version for backend."
  type        = string
  default     = null
}

variable "frontend_node_version" {
  description = "Node version for frontend."
  type        = string
  default     = null
}

variable "frontend_python_version" {
  description = "Python version for frontend."
  type        = string
  default     = null
}
