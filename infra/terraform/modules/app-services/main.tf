resource "azurerm_resource_group" "as_rg" {
  name     = var.app_service_rg_name
  location = var.app_service_rg_location
}

resource "azurerm_app_service_plan" "as_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.as_rg.location
  resource_group_name = azurerm_resource_group.as_rg.name

  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.as_rg.location
  resource_group_name = azurerm_resource_group.as_rg.name
  app_service_plan_id = azurerm_app_service_plan.as_plan.id

  # site_config {
  #   dotnet_framework_version = "v4.0"
  #   scm_type                 = "LocalGit"
  # }

  # app_settings = {
  #   "SOME_KEY" = "some-value"
  # }

  # connection_string {
  #   name  = "Database"
  #   type  = "SQLServer"
  #   value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  # }
}