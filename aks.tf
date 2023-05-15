# main.tf

provider "azurerm" {
  features {}
}


resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aksname
  location            = var.location
  resource_group_name = var.resourcegroupname
  dns_prefix          = var.aksdnsprefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  service_principal {
    client_id     = var.clientid
    client_secret = var.clientsecret
  }

  tags = {
    environment = "Dev"
    CreatedBy = "Prashanth"
  }
}

