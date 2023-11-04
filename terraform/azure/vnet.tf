# Virtual Network
resource "azurerm_virtual_network" "jpetstore-vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.jpetstore-rg.location
  resource_group_name = azurerm_resource_group.jpetstore-rg.name

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Virtual Network"
    project     = "${var.project}"
  }
}