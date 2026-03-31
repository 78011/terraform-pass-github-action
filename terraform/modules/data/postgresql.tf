# modules/data/postgresql.tf

moved {
  from = azurerm_postgresql_flexible_server.PostGre1
  to   = azurerm_postgresql_flexible_server.db
}

moved {
  from = azurerm_postgresql_flexible_server_database.PostGre1DB
  to   = azurerm_postgresql_flexible_server_database.db
}

# NOUVEAU : azurerm_postgresql_flexible_server (remplace postgresql_server)
resource "azurerm_postgresql_flexible_server" "db" {
    name                   = var.postgre_name
    resource_group_name    = var.postgre_rg
    location               = var.postgre_location
    version                = "16"  # Version 9.6 est dépréciée, utiliser 14, 15 ou 16
    administrator_login    = var.postgre_login
    administrator_password = var.postgre_password

    storage_mb   = 32768  # 32 Go minimum
    sku_name     = "B_Standard_B1ms"  # SKU Burstable pour dev

    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false  # Désactivé pour économiser

    # En dev on peut laisser public, en prod ajouter delegated_subnet_id
    public_network_access_enabled = true
}

# NOUVEAU : azurerm_postgresql_flexible_server_database
resource "azurerm_postgresql_flexible_server_database" "db" {
    name      = "lvmdb"
    server_id = azurerm_postgresql_flexible_server.db.id
    charset   = "UTF8"
    collation = "en_US.utf8"  # Format différent de v2.x
}

output "postgre_fqdn" {
    value       = azurerm_postgresql_flexible_server.db.fqdn
    description = "FQDN du serveur PostgreSQL"
}
