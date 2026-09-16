output "app_service_name" {
  description = "Azure Web App name."
  value       = azurerm_linux_web_app.express_app.name
}

output "app_service_hostname" {
  description = "Default hostname of the Web App."
  value       = azurerm_linux_web_app.express_app.default_hostname
}

output "app_service_url" {
  description = "HTTPS URL of the Web App."
  value       = "https://${azurerm_linux_web_app.express_app.default_hostname}"
}
