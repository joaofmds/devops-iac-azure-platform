variable "resource_group_name" {
  description = "Resource group name for networking resources."
  type        = string
}

variable "location" {
  description = "Azure region for networking resources."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "Address space for the virtual network."
  type        = list(string)
}

variable "subnet_frontend_name" {
  description = "Name of the frontend subnet."
  type        = string
}

variable "subnet_backend_name" {
  description = "Name of the backend subnet."
  type        = string
}

variable "subnet_database_name" {
  description = "Name of the database subnet."
  type        = string
}

variable "subnet_frontend_cidr" {
  description = "CIDR for frontend subnet."
  type        = string
}

variable "subnet_backend_cidr" {
  description = "CIDR for backend subnet."
  type        = string
}

variable "subnet_database_cidr" {
  description = "CIDR for database subnet."
  type        = string
}

variable "tags" {
  description = "Tags to apply to networking resources."
  type        = map(string)
}
