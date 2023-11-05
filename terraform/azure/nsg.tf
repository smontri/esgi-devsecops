# Network Security Group and rule
resource "azurerm_network_security_group" "ci-cd-nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.ci-cd-rg.location
  resource_group_name = azurerm_resource_group.ci-cd-rg.name

  # Allow incoming connection on port 22 for SSH
  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Network Security Group"
    project     = "${var.project}"
  }
}

# Network Interface
resource "azurerm_network_interface" "ci-cd-nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.ci-cd-rg.location
  resource_group_name = azurerm_resource_group.ci-cd-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.ci-cd-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ci-cd-ip.id
  }

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Network Interface"
    project     = "${var.project}"
  }
}

# Associate Network Security group with Subnet
resource "azurerm_subnet_network_security_group_association" "nsg-subnet" {
  subnet_id                 = azurerm_subnet.ci-cd-subnet.id
  network_security_group_id = azurerm_network_security_group.ci-cd-nsg.id
}