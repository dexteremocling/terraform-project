
output "database_instance_name" {
  description = "The name of the Azure PostgreSQL database instance"
  value       = azurerm_postgresql_server.db_instance.name
}

