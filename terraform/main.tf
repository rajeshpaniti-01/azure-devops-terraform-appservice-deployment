resource "azurerm_resource_group" "express_app" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "express_app" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.express_app.name
  location            = azurerm_resource_group.express_app.location

  os_type  = "Linux"
  sku_name = var.app_service_sku
}

resource "azurerm_linux_web_app" "express_app" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.express_app.name
  location            = azurerm_resource_group.express_app.location
  service_plan_id     = azurerm_service_plan.express_app.id

  https_only = true

  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false

  site_config {
    always_on = false

    ftps_state = "FtpsOnly"

    ip_restriction_default_action     = "Allow"
    scm_ip_restriction_default_action = "Allow"

    minimum_tls_version = "1.2"

    application_stack {
      node_version = var.node_version
    }
  }

  app_settings = {
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }
}
