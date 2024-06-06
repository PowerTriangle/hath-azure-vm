resource "azurerm_public_ip" "webserver" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${local.prefex}-pip"
  location            = var.rg.location
  resource_group_name = var.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "webserver" {
  name                = "${local.prefex}-nic"
  location            = var.rg.location
  resource_group_name = var.rg.name

  ip_configuration {
    name                          = "webserver-ipconfig"
    subnet_id                     = var.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.webserver[0].id : null
  }
}

data "template_file" "cloud_init" {
  template = optional(var.cloudinit, file("${path.module}/cloud-init.yml"))
}

resource "azurerm_virtual_machine" "webserver" {
  name                  = local.prefex
  location              = var.rg.location
  resource_group_name   = var.rg.name
  network_interface_ids = [azurerm_network_interface.webserver.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"
    custom_data    = base64encode(data.template_file.cloud_init.rendered)
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
