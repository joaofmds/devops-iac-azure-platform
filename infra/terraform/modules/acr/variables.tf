variable "name" {
  description = "ACR name."
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

variable "sku" {
  description = "SKU for ACR."
  type        = string
  default     = "Standard"
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
}
