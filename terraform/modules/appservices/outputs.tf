# default_site_hostname  →  default_hostname (depuis AzureRM v3)
output "app_service_url" {
    value = azurerm_windows_web_app.dev_app_service.default_hostname
}