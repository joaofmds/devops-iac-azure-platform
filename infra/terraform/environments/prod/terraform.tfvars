project_name  = "devops-platform"
environment   = "prod"
location      = "eastus2"

tags = {
  owner       = "devops-team"
  cost-center = "platform"
}

vnet_address_space  = ["10.20.0.0/16"]
subnet_frontend_cidr = "10.20.1.0/24"
subnet_backend_cidr  = "10.20.2.0/24"
subnet_database_cidr = "10.20.3.0/24"

storage_account_name  = "devopsplatprodsa"
storage_retention_days = 90

acr_name = "devopsplatprodacr"
acr_sku  = "Standard"

key_vault_name = "devopsplatprodkv"

postgres_server_name          = "devopsplatprodpg"
postgres_version              = "14"
postgres_sku_name             = "GP_Standard_D2s_v3"
postgres_storage_mb           = 65536
postgres_backup_retention_days = 14
postgres_admin_username       = "pgadmin"
postgres_database_name        = "appdb"

backend_service_plan_sku  = "P1v3"
frontend_service_plan_sku = "P1v3"
backend_node_version      = "18-lts"
frontend_node_version     = "18-lts"
