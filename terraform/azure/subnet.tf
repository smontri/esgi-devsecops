# Subnet
resource "azurerm_subnet" "ci-cd-subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.ci-cd-rg.name
  virtual_network_name = azurerm_virtual_network.ci-cd-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}