output "server" {
  value     = azurerm_virtual_machine.webserver
  sensitive = true
}