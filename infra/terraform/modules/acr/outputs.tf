output "login_server" {
  description = "ACR login server."
  value       = azurerm_container_registry.main.login_server
}

output "acr_id" {
  description = "ACR ID."
  value       = azurerm_container_registry.main.id
}
