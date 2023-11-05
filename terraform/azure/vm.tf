# Virtual Machine
resource "azurerm_linux_virtual_machine" "ci-cd-vm" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.ci-cd-rg.location
  resource_group_name   = azurerm_resource_group.ci-cd-rg.name
  network_interface_ids = [
    azurerm_network_interface.ci-cd-nic.id
  ]
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"

  admin_ssh_key {
    username = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    caching               = "ReadWrite"
    storage_account_type  = "Standard_LRS"
  }

  tags = {
    environment = "${var.environment}"
    owner       = "${var.prefix}"
    label       = "Virtual Machine"
    project     = "${var.project}"
  }
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.ci-cd-vm.name
}
