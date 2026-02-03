variable "app_service_rg_name" {
  description = "The name of resource group for the app service"
  type        = string
}

variable "app_service_rg_location" {
  description = "The location of the app service"
  type        = string
}

variable "app_service_plan_sku_tier" {
  description = "The tier of the app service"
  type        = string
}

variable "app_service_plan_sku_size" {
  description = "The size of the app service"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  type        = string
}

variable "app_service_plan_id" {
  description = "The id of the app service plan"
  type        = string
}

variable "app_service_name" {
  description = "The name of the app service"
  type        = string
}