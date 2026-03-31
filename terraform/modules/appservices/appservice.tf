# Création du Plan App Service (La machine sous-jacente qui héberge le site)
resource "azurerm_app_service_plan" "dev_app_service_plan" {
    name                = var.app_service_plan_name
    location            = var.app_service_plan_location
    resource_group_name = var.app_service_plan_rg

    sku {
        tier = var.app_service_plan_tiers
        size = var.app_service_plan_sku
    }
}

# Création de l'App Service (Le site web en lui-même)
resource "azurerm_app_service" "dev_app_service" {
    name                = var.app_service_name
    location            = var.app_service_location
    resource_group_name = var.app_service_rg
    app_service_plan_id = azurerm_app_service_plan.dev_app_service_plan.id

    site_config {
        dotnet_framework_version = "v4.0"
        scm_type                 = "LocalGit"
    }

    tags = {
        environment = var.app_service_tag_env
    }

    app_settings = {
        "SOME_KEY" = "some-value"
    }

    connection_string {
        name  = "Database"
        type  = "PostgreSQL" 
        value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
    }
}

# La valeur de sortie qui remontera jusqu'au main.tf principal
output "app_service_url" {
    value       = azurerm_app_service.dev_app_service.default_site_hostname
    description = "URL to connect to App Service"
}