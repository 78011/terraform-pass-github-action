# modules/appservices/appservice.tf

# NOUVEAU NOM : azurerm_service_plan (remplace app_service_plan)
resource "azurerm_service_plan" "dev_plan" {
    name                = var.service_plan_name
    location            = var.service_plan_location
    resource_group_name = var.service_plan_rg
    os_type             = var.service_plan_os   # "Linux" ou "Windows"
    sku_name            = var.service_plan_sku  # "S1", "P1v2", etc.
}

# NOUVEAU NOM : azurerm_linux_web_app (remplace app_service)
resource "azurerm_linux_web_app" "dev_app" {
    name                = var.app_name
    location            = var.app_location
    resource_group_name = var.app_rg
    service_plan_id     = azurerm_service_plan.dev_plan.id

    site_config {
        application_stack {
        node_version = "20-lts"  # Ou python_version, dotnet_version, etc.
        }
    }

    app_settings = {
        "SOME_KEY" = "some-value"
    }

    connection_string {
        name  = "Database"
        type  = "PostgreSQL"
        value = "Server=${var.db_host};Database=lvmdb;..."
    }

    tags = {
        environment = var.app_tag_env
    }
}

output "app_url" {
    value       = azurerm_linux_web_app.dev_app.default_hostname
    description = "URL de l'application"
}
