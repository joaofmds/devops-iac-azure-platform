output "resource_group_name" {
  description = "Resource group name."
  value       = azurerm_resource_group.main.name
}

output "backend_app_name" {
  description = "Backend app name."
  value       = module.backend.app_name
}

output "frontend_app_name" {
  description = "Frontend app name."
  value       = module.frontend.app_name
}

output "backend_hostname" {
  description = "Backend default hostname."
  value       = module.backend.default_hostname
}

output "frontend_hostname" {
  description = "Frontend default hostname."
  value       = module.frontend.default_hostname
}
