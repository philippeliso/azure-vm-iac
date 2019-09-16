# Create network interface
resource "azurerm_network_interface" "az-eus-if-rails1" {
  name                      = "az-eus-if-rails1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                                    = "az-eus-if-config-rails1"
    subnet_id                               = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation           = "static"
    private_ip_address                      = "10.0.0.4"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"]
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "az-eus-if-rails2" {
  name                      = "az-eus-if-rails2"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                                    = "az-eus-if-config-rails2"
    subnet_id                               = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation           = "static"
    private_ip_address                      = "10.0.0.5"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"]
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "az-eus-if-rails3" {
  name                      = "az-eus-if-rails3"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                                    = "az-eus-if-config-rails3"
    subnet_id                               = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation           = "static"
    private_ip_address                      = "10.0.0.6"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"]
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "az-eus-if-rails4" {
  name                      = "az-eus-if-rails4"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                                    = "az-eus-if-config-rails4"
    subnet_id                               = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation           = "static"
    private_ip_address                      = "10.0.0.7"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"]
  }

  tags {
    environment = "Production"
  }
}

# Create network interface
resource "azurerm_network_interface" "az-eus-if-railsjobs1" {
  name                      = "az-eus-if-railsjobs1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                          = "az-eus-if-config-railsjobs1"
    subnet_id                     = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.0.8"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"]
  }

  tags {
    environment = "Production"
  }
}

# Create network interface
resource "azurerm_network_interface" "az-eus-if-webcache1" {
  name                      = "az-eus-if-webcache1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                          = "az-eus-if-config-webcache1"
    subnet_id                     = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.0.9"
  }

  tags {
    environment = "Production"
  }
}

# Create network interface
resource "azurerm_network_interface" "az-eus-if-psql1" {
  name                      = "az-eus-if-psql1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-default.id}"

  ip_configuration {
    name                          = "az-eus-if-config-psql1"
    subnet_id                     = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.0.10"
  }

  tags {
    environment = "Production"
  }
}

# Create network interface
resource "azurerm_network_interface" "az-eus-if-devops1" {
  name                      = "az-eus-if-devops1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-vpn.id}"

  ip_configuration {
    name                          = "az-eus-if-config-devops1"
    subnet_id                     = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.0.11"
    public_ip_address_id          = "${azurerm_public_ip.az-eus-if-pub-prod-devops1.id}"
  }

  tags {
    environment = "Production"
  }
}

# Create network interface for influxdb1
resource "azurerm_network_interface" "az-eus-if-prod-influxdb1" {
  name                      = "az-eus-if-prod-influxdb1"
  location                  = "East US"
  resource_group_name       = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_security_group_id = "${azurerm_network_security_group.az-eus-nsg-prod-influxdb.id}"

  ip_configuration {
    name                          = "az-eus-if-prod-config-influxdb1"
    subnet_id                     = "${azurerm_subnet.az-eus-subnet-prod1.id}"
    private_ip_address_allocation = "static"
    private_ip_address            = "10.0.0.12"
    # public_ip_address_id          = "${azurerm_public_ip.az-eus-if-pub-prod-influxdb1.id}"
  }

  tags {
    environment = "Production"
  }
}
