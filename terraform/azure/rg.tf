# Resource Group
resource "azurerm_resource_group" "jpetstore-rg" {
  name     = "${var.prefix}-resources"
  location = "North Europe"

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Resource Group"
    project     = "${var.project}"
  }
}