# 1. Module Réseau
module "network"{
    source = "./modules/network"

    network_name     = "vnet-ousmane-app"
    network_location = azurerm_resource_group.example.location
    network_rg       = azurerm_resource_group.example.name

    depends_on = [azurerm_resource_group.example]
}

# 2. Module Application Web
module "appservice"{
    source = "./modules/appservices"

    app_service_plan_name     = "plan-ousmane-dev"
    app_service_plan_location = azurerm_resource_group.example.location
    app_service_plan_rg       = azurerm_resource_group.example.name
    app_service_plan_tiers    = "Standard"
    app_service_plan_sku      = "S1"

    # ATTENTION : Ce nom génère l'URL de ton site, il doit être unique !
    app_service_name     = "webapp-ousmane-2026" 
    app_service_location = azurerm_resource_group.example.location
    app_service_rg       = azurerm_resource_group.example.name
    app_service_tag_env  = "dev"

    depends_on = [azurerm_resource_group.example]
}

# 3. Module Base de données PostgreSQL
module "postgre"{
    source = "./modules/data"

    # ATTENTION : Ce nom génère l'URL de la base, il doit être unique !
    postgre_name                         = "pg-ousmane-2026" 
    postgre_location                     = azurerm_resource_group.example.location
    postgre_rg                           = azurerm_resource_group.example.name
    postgre_administrator_login          = var.administrator_login
    postgre_administrator_login_password = var.administrator_login_password
    postgre_sku_name                     = "GP_Gen5_4"
    postgre_version                      = "9.6"
    postgre_storage_mb                   = "640000"

    depends_on = [azurerm_resource_group.example]
}

# 4. Groupe de ressources de l'application
resource "azurerm_resource_group" "example" {
    name     = "rg-app-ousmane"
    location = "northeurope"
}

# 5. Variables de sortie
output "app_service_url" {
    value = module.appservice.app_service_url
}

output "postgre_sql_fqdn" {
    value = module.postgre.postgre_fqdn
}