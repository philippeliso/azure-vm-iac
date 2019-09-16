variable "resourcename" {
  default = "myResourceGroup"
}

provider "azurerm" {
  subscription_id = "your-subscrition-id"
  client_id       = "http://your-appid-here"                  # appId
  client_secret   = "your-passaword-here"   # password
  tenant_id       = "your-tenant-id"    # tenant
}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "az-eus-rs-prod" {
  name     = "az-eus-rs-prod"
  location = "East US"

  tags {
    environment = "Production"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "az-eus-vnet-prod1" {
  name                = "az-eus-vnet-prod1"
  address_space       = ["10.0.0.0/24"]
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"

  tags {
    environment = "Production"
  }
}

# Create subnet
resource "azurerm_subnet" "az-eus-subnet-prod1" {
  name                 = "az-eus-subnet-prod1"
  resource_group_name  = "${azurerm_resource_group.az-eus-rs-prod.name}"
  virtual_network_name = "${azurerm_virtual_network.az-eus-vnet-prod1.name}"
  address_prefix       = "10.0.0.0/27"
}
