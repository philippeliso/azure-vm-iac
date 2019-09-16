resource "azurerm_storage_share" "az-eus-stg-bkp-psql" {
  name = "az-eus-stg-bkp-psql"

  resource_group_name  = "${azurerm_resource_group.az-eus-rs-prod.name}"
  storage_account_name = "${azurerm_storage_account.azeusstgaccsomename.name}"

  quota = 100 # 100GB
  
  # tags {
  #   environment = "Production"
  # }
}

