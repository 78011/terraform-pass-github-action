# Création du Serveur Flexible (Standard actuel)
resource "azurerm_postgresql_flexible_server" "PostGre1" {
    name                   = var.postgre_name
    resource_group_name    = var.postgre_rg
    location               = var.postgre_location
    version                = "16" # Version stable actuelle
    
    administrator_login    = var.postgre_administrator_login
    administrator_password = var.postgre_administrator_login_password

    storage_mb = 32768 # Taille minimale pour flexible (32 Go)
    sku_name   = "B_Standard_B1ms" # Instance burstable économique
}

resource "azurerm_postgresql_flexible_server_database" "PostGre1DB" {
    name      = "lvmdb"
    server_id = azurerm_postgresql_flexible_server.PostGre1.id
    charset   = "UTF8"
    collation = "en_US.utf8"
}

output "postgre_fqdn" {
    value = azurerm_postgresql_flexible_server.PostGre1.fqdn
}