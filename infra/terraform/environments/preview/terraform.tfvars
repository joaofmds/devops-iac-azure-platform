project_name  = "devops-platform"
environment   = "preview"
location      = "eastus2"

tags = {
  owner       = "devops-team"
  cost-center = "platform"
}

vnet_address_space  = ["10.30.0.0/16"]
subnet_frontend_cidr = "10.30.1.0/24"
subnet_backend_cidr  = "10.30.2.0/24"
subnet_database_cidr = "10.30.3.0/24"

storage_account_name  = "devopsplatpreview"
storage_retention_days = 7

acr_name = "devopsplatprevacr"
acr_sku  = "Standard"

key_vault_name = "devopsplatprevkv"

postgres_server_name          = "devopsplatprevpg"
postgres_version              = "14"
postgres_sku_name             = "GP_Standard_D2s_v3"
postgres_storage_mb           = 32768
postgres_backup_retention_days = 7
postgres_admin_username       = "pgadmin"
postgres_database_name        = "appdb"

backend_service_plan_sku  = "P1v2"
frontend_service_plan_sku = "P1v2"
backend_node_version      = "18-lts"
frontend_node_version     = "18-lts"
