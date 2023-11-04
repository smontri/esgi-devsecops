# Subnet
resource "azurerm_subnet" "jpetstore-subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.jpetstore-rg.name
  virtual_network_name = azurerm_virtual_network.jpetstore-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}