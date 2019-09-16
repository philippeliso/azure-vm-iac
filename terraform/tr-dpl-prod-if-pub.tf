# Create public IPs
resource "azurerm_public_ip" "az-eus-if-pub-prod-devops1" {
  name                         = "az-eus-if-pub-prod-devops1"
  location                     = "East US"
  resource_group_name          = "${azurerm_resource_group.az-eus-rs-prod.name}"
  public_ip_address_allocation = "dynamic"

  tags {
    environment = "Production"
  }
}

# Public IP for Loadbalancer
resource "azurerm_public_ip" "az-eus-if-pub-prod-company" {
  name                         = "az-eus-if-pub-prod-company"
  location                     = "East US"
  resource_group_name          = "${azurerm_resource_group.az-eus-rs-prod.name}"
  public_ip_address_allocation = "static"
  domain_name_label            = "company-prod"

  tags {
    environment = "Production"
  }
}

# Public IP for influxdb1
resource "azurerm_public_ip" "az-eus-if-pub-prod-influxdb1" {
  name                         = "az-eus-if-pub-prod-influxdb1"
  location                     = "East US"
  resource_group_name          = "${azurerm_resource_group.az-eus-rs-prod.name}"
  public_ip_address_allocation = "dynamic"
  domain_name_label            = "company-prod-influxdb"

  tags {
    environment = "Production"
  }
}

