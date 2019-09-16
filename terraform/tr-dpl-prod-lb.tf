# Load Balancer
resource "azurerm_lb" "az-eus-lb-prod-company" {
  name                = "TestLoadBalancer"
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"

  frontend_ip_configuration {
    name                 = "az-eus-lb-fe-prod-company"
    public_ip_address_id = "${azurerm_public_ip.az-eus-if-pub-prod-company.id}"
  }

  tags {
    environment = "Production"
  }
}

resource "azurerm_lb_backend_address_pool" "az-eus-lb-be-pool-prod-rails" {
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"
  loadbalancer_id     = "${azurerm_lb.az-eus-lb-prod-company.id}"
  name                = "az-eus-lb-be-pool-prod-rails"
}

resource "azurerm_lb_probe" "az-eus-lb-probe-prod-company" {
  resource_group_name = "${azurerm_resource_group.az-eus-rs-prod.name}"
  loadbalancer_id     = "${azurerm_lb.az-eus-lb-prod-company.id}"
  name                = "az-eus-lb-probe-prod-company"
  port                = 3001
  protocol            = "Http"
  request_path        = "/admin/login"
  interval_in_seconds = "5"
  number_of_probes    = "2"
}

resource "azurerm_lb_rule" "az-eus-lb-rule-prod-company" {
  resource_group_name            = "${azurerm_resource_group.az-eus-rs-prod.name}"
  loadbalancer_id                = "${azurerm_lb.az-eus-lb-prod-company.id}"
  name                           = "az-eus-lb-rule-prod-company"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 3001
  frontend_ip_configuration_name = "az-eus-lb-fe-prod-company"
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"
  probe_id                       = "${azurerm_lb_probe.az-eus-lb-probe-prod-company.id}"
  idle_timeout_in_minutes        = 4
}

resource "azurerm_lb_rule" "az-eus-lb-rule-prod-ssl-company" {
  resource_group_name            = "${azurerm_resource_group.az-eus-rs-prod.name}"
  loadbalancer_id                = "${azurerm_lb.az-eus-lb-prod-company.id}"
  name                           = "az-eus-lb-rule-prod-ssl-company"
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 3000
  frontend_ip_configuration_name = "az-eus-lb-fe-prod-company"
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.az-eus-lb-be-pool-prod-rails.id}"
  probe_id                       = "${azurerm_lb_probe.az-eus-lb-probe-prod-company.id}"
  idle_timeout_in_minutes        = 4
}

# Create availability set
resource "azurerm_availability_set" "az-eus-avset-prod-rails" {
  name                         = "az-eus-avset-prod-rails"
  managed                      = "true"
  platform_fault_domain_count  = "3"
  platform_update_domain_count = "5"
  location                     = "${azurerm_resource_group.az-eus-rs-prod.location}"
  resource_group_name          = "${azurerm_resource_group.az-eus-rs-prod.name}"

  tags {
    environment = "Production"
  }
}
