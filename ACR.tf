
provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "acr" {
  name                     = "Foresterstest"
  resource_group_name      = var.resourcegroupname
  location                 = var.location
  sku                      = "Standard"  
  admin_enabled            = false
  georeplication_locations = []       
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}
