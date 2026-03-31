# azurerm_app_service_plan  →  azurerm_service_plan (depuis AzureRM v3)
resource "azurerm_service_plan" "dev_app_service_plan" {
    name                = var.app_service_plan_name
    location            = var.app_service_plan_location
    resource_group_name = var.app_service_plan_rg
    os_type             = "Windows"
    sku_name            = var.app_service_plan_sku
}

# azurerm_app_service  →  azurerm_windows_web_app (depuis AzureRM v3)
resource "azurerm_windows_web_app" "dev_app_service" {
    name                = var.app_service_name
    location            = var.app_service_location
    resource_group_name = var.app_service_rg
    service_plan_id     = azurerm_service_plan.dev_app_service_plan.id

    app_settings = {
        "SOME_KEY" = "some-value"
    }

    site_config {
        application_stack {
            current_stack  = "dotnet"
            dotnet_version = "v4.0"
        }
    }

    tags = {
        environment = var.app_service_tag_env
    }
}