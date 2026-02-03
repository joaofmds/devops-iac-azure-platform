variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "service_plan_name" {
  description = "App Service plan name."
  type        = string
}

variable "service_plan_sku" {
  description = "App Service plan SKU name."
  type        = string
}

variable "app_name" {
  description = "Web app name."
  type        = string
}

variable "integration_subnet_id" {
  description = "Subnet ID for VNet integration."
  type        = string
}

variable "node_version" {
  description = "Node.js version."
  type        = string
  default     = null
}

variable "python_version" {
  description = "Python version."
  type        = string
  default     = null
}

variable "app_settings" {
  description = "App settings map."
  type        = map(string)
  default     = {}
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics workspace ID."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
}
