output "resource_group_name" {
  description = "Resource group name."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "Resource group ID."
  value       = azurerm_resource_group.main.id
}

output "location" {
  description = "Azure region location."
  value       = azurerm_resource_group.main.location
}

output "name_prefix" {
  description = "Name prefix for resources (project_name-environment)."
  value       = var.name_prefix
}

output "tags" {
  description = "Tags applied to resources."
  value       = var.tags
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID."
  value       = azurerm_log_analytics_workspace.main.id
}

output "log_analytics_workspace_name" {
  description = "Log Analytics Workspace name."
  value       = azurerm_log_analytics_workspace.main.name
}
