# Public IPs
resource "azurerm_public_ip" "jpetstore-ip" {
  name                = "${var.prefix}-ip"
  location            = azurerm_resource_group.jpetstore-rg.location
  resource_group_name = azurerm_resource_group.jpetstore-rg.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Public IP"
    project     = "${var.project}"
  }
}

output "public_ip" {
  value = azurerm_public_ip.jpetstore-ip.ip_address
}