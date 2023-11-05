# Resource Group
resource "azurerm_resource_group" "ci-cd-rg" {
  name     = "${var.prefix}-resources"
  location = "North Europe"

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Resource Group"
    project     = "${var.project}"
  }
}