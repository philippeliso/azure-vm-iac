# Create Network Security Group and rule
resource "azurerm_network_security_group" "az-eus-nsg-prod-default" {
  name                = "az-eus-nsg-prod-default"
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"

  security_rule {
    name                       = "rails-3000"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3000"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rails-3001"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3001"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "az-eus-nsg-prod-vpn" {
  name                = "az-eus-nsg-prod-vpn"
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"

  security_rule {
    name                       = "ssh-8083"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8083"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "openvpn-8082"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8082"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "apache_443"
    description                = "apache_443"
    priority                   = 1012
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "az-eus-nsg-prod-influxdb" {
  name                = "az-eus-nsg-prod-influxdb"
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"

  security_rule {
    name                       = "influxdb-api-8082"
    description                = "191.200.200.200 - old\n54.0.0.100 - new"
    priority                   = 1010
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "8082"
    source_address_prefix      = "54.0.0.100"
    destination_address_prefix = "*"
  }

  tags {
    environment = "Production"
  }
}
