output "key_vault_id" {
  description = "Key Vault ID."
  value       = azurerm_key_vault.main.id
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = azurerm_key_vault.main.vault_uri
}

output "secret_names" {
  description = "Map of secret names to their resource names."
  value       = { for k, v in azurerm_key_vault_secret.secrets : k => v.name }
  sensitive   = true
}

output "access_policy_ids" {
  description = "Map of access policy IDs."
  value       = { for k, v in azurerm_key_vault_access_policy.policies : k => v.id }
}
