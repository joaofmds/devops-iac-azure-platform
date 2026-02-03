module "test-cultivo-dev" {
  source = "../../modules"
  app_service_rg_name = var.app_service_rg_name
  app_service_rg_location = var.app_service_rg_location
  app_service_plan_name = var.app_service_plan_name
  app_service_plan_sku_tier = var.app_service_plan_sku_tier
  app_service_plan_sku_size = var.app_service_plan_sku_size
  app_service_name = var.app_service_name
  app_service_plan_id = var.app_service_plan_id
  database_rg_name = var.database_rg_name
  database_rg_location = var.database_rg_location
  database_name = var.database_name
  database_sku_name = var.database_sku_name
  database_sku_size = var.database_sku_size
  database_sku_tier = var.database_sku_tier
  database_sku_family = var.database_sku_family
  database_sku_capacity = var.database_sku_capacity'
}