# Create virtual machine az-eus-nix-prod-influxdb1
resource "azurerm_virtual_machine" "az-eus-nix-prod-influxdb1" {
  name                  = "az-eus-nix-prod-influxdb1"
  location              = "East US"
  resource_group_name   = "${azurerm_resource_group.az-eus-rs-prod.name}"
  network_interface_ids = ["${azurerm_network_interface.az-eus-if-prod-influxdb1.id}"]
  vm_size               = "Standard_B2s"

  #vm_size                          = "Standard_DS2_v2_Promo"
  delete_data_disks_on_termination = "true"
  delete_os_disk_on_termination    = "true"

  storage_os_disk {
    name              = "az-eus-os-disk-prod-influxdb1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "az-eus-nix-prod-influxdb1"
    admin_username = "mutley"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/mutley/.ssh/authorized_keys"
      key_data = "ssh-rsa ahsofiauhsdofiaushdoaiuhdfoaisduhofaisudhfoasudhfoaisudhfoaisudfh"
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.azeusstgaccsomename.primary_blob_endpoint}"
  }

  tags {
    environment = "Production"
  }
}
