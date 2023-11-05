# Public IPs
resource "azurerm_public_ip" "ci-cd-ip" {
  name                = "${var.prefix}-ip"
  location            = azurerm_resource_group.ci-cd-rg.location
  resource_group_name = azurerm_resource_group.ci-cd-rg.name
  allocation_method   = "Dynamic"

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Public IP"
    project     = "${var.project}"
  }
}

output "public_ip" {
  value = azurerm_public_ip.ci-cd-ip.ip_address
}