# main.tf

# 1. Groupe de ressources
resource "azurerm_resource_group" "example" {
    name     = "rg-app-ousmane"
    location = "northeurope"
}

# 2. Module Réseau
module "network" {
    source = "./modules/network"

    network_name     = "vnet-ousmane-app"
    network_location = azurerm_resource_group.example.location
    network_rg       = azurerm_resource_group.example.name

    depends_on = [azurerm_resource_group.example]
}

# 3. Module App Service (NOUVEAU : Linux Web App)
module "appservice" {
    source = "./modules/appservices"

    service_plan_name     = "plan-ousmane-dev"
    service_plan_location = azurerm_resource_group.example.location
    service_plan_rg       = azurerm_resource_group.example.name
    service_plan_os       = "Linux"
    service_plan_sku      = "F1"

    app_name     = "webapp-ousmane-2026"
    app_location = azurerm_resource_group.example.location
    app_rg       = azurerm_resource_group.example.name
    app_tag_env  = "dev"

    db_host      = module.postgre.postgre_fqdn
    
    depends_on = [azurerm_resource_group.example]
}

# 4. Module PostgreSQL Flexible Server
module "postgre" {
    source = "./modules/data"

    postgre_name     = "pg-ousmane-2026"
    postgre_location = azurerm_resource_group.example.location
    postgre_rg       = azurerm_resource_group.example.name
    postgre_login    = var.administrator_login
    postgre_password = var.administrator_login_password

    depends_on = [azurerm_resource_group.example]
}

# Outputs
output "app_service_url" {
    value = module.appservice.app_url
}

output "postgre_fqdn" {
    value     = module.postgre.postgre_fqdn
    sensitive = true
}
