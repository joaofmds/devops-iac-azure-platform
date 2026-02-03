locals {
  name_prefix = "${var.project_name}-${var.environment}"
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}

module "platform" {
  source = "../../modules/platform"

  name_prefix = local.name_prefix
  location    = var.location
  tags        = local.tags
}

module "network" {
  source               = "../../modules/network"
  resource_group_name  = module.platform.resource_group_name
  location             = module.platform.location
  vnet_name            = "${local.name_prefix}-vnet"
  address_space        = var.vnet_address_space
  subnet_frontend_name = "${local.name_prefix}-snet-frontend"
  subnet_backend_name  = "${local.name_prefix}-snet-backend"
  subnet_database_name = "${local.name_prefix}-snet-database"
  subnet_frontend_cidr = var.subnet_frontend_cidr
  subnet_backend_cidr  = var.subnet_backend_cidr
  subnet_database_cidr = var.subnet_database_cidr
  tags                 = local.tags
}

module "storage" {
  source              = "../../modules/storage-account"
  name                = var.storage_account_name
  resource_group_name = module.platform.resource_group_name
  location            = module.platform.location
  retention_days      = var.storage_retention_days
  tags                = local.tags
}

module "acr" {
  source              = "../../modules/acr"
  name                = var.acr_name
  resource_group_name = module.platform.resource_group_name
  location            = module.platform.location
  sku                 = var.acr_sku
  tags                = local.tags
}

module "database" {
  source                = "../../modules/database"
  name                  = var.postgres_server_name
  resource_group_name   = module.platform.resource_group_name
  location              = module.platform.location
  postgres_version      = var.postgres_version
  sku_name              = var.postgres_sku_name
  storage_mb            = var.postgres_storage_mb
  backup_retention_days = var.postgres_backup_retention_days
  admin_username        = var.postgres_admin_username
  database_name         = var.postgres_database_name
  delegated_subnet_id   = module.network.database_subnet_id
  vnet_id               = module.network.vnet_id
  tags                  = local.tags
}

module "key_vault" {
  source              = "../../modules/key-vault"
  name                = var.key_vault_name
  resource_group_name = module.platform.resource_group_name
  location            = module.platform.location
  tags                = local.tags
  secrets = {
    "postgres-connection-string" = module.database.connection_string
  }
}

module "backend" {
  source                    = "../../modules/app-services"
  resource_group_name       = module.platform.resource_group_name
  location                  = module.platform.location
  service_plan_name         = "${local.name_prefix}-backend-plan"
  service_plan_sku          = var.backend_service_plan_sku
  app_name                  = "${local.name_prefix}-backend"
  integration_subnet_id     = module.network.backend_subnet_id
  node_version              = var.backend_node_version
  python_version            = var.backend_python_version
  log_analytics_workspace_id = module.platform.log_analytics_workspace_id
  app_settings = {
    "APP_ENV"                    = var.environment
    "POSTGRES_CONNECTION_STRING" = "@Microsoft.KeyVault(SecretUri=${module.key_vault.key_vault_uri}secrets/postgres-connection-string/)"
    "RUN_MIGRATIONS"             = "true"
  }
  tags = local.tags
}

module "frontend" {
  source                    = "../../modules/app-services"
  resource_group_name       = module.platform.resource_group_name
  location                  = module.platform.location
  service_plan_name         = "${local.name_prefix}-frontend-plan"
  service_plan_sku          = var.frontend_service_plan_sku
  app_name                  = "${local.name_prefix}-frontend"
  integration_subnet_id     = module.network.frontend_subnet_id
  node_version              = var.frontend_node_version
  python_version            = var.frontend_python_version
  log_analytics_workspace_id = module.platform.log_analytics_workspace_id
  app_settings = {
    "APP_ENV"     = var.environment
    "API_BASE_URL" = "https://${module.backend.default_hostname}"
  }
  tags = local.tags
}

data "azurerm_client_config" "current" {}

# Update Key Vault access policies after backend and frontend are created
resource "azurerm_key_vault_access_policy" "backend" {
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.backend.principal_id

  secret_permissions = ["Get", "List"]
}

resource "azurerm_key_vault_access_policy" "frontend" {
  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.frontend.principal_id

  secret_permissions = ["Get", "List"]
}
