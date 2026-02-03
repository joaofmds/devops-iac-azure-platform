variable "name_prefix" {
  description = "Name prefix for resources (project_name-environment)."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
}

variable "log_analytics_sku" {
  description = "Log Analytics Workspace SKU."
  type        = string
  default     = "PerGB2018"
}

variable "log_analytics_retention_days" {
  description = "Log Analytics retention in days."
  type        = number
  default     = 30
}
