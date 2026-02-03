output "app_id" {
  description = "ID of the web app."
  value       = azurerm_linux_web_app.main.id
}

output "app_name" {
  description = "Name of the web app."
  value       = azurerm_linux_web_app.main.name
}

output "default_hostname" {
  description = "Default hostname of the web app."
  value       = azurerm_linux_web_app.main.default_hostname
}

output "principal_id" {
  description = "Principal ID of the managed identity."
  value       = azurerm_linux_web_app.main.identity[0].principal_id
}
