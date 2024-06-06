# hath-azure-vm
hackathon azure vm module


This module deploy an server to the correct enviroument by defult this deploys and webserver

```
module "server" {
  source      = "git::ssh://git@github.com/PowerTriangle/hath-azure-vm.git?ref=<version>"
  rg          = azurerm_resource_group.myresource
  project     = "training"
  environment = "dev"
  subnet      = <subnet id>
  create_public_ip = false
  cloudinit = file("${path.module}/cloud-init.yml")
}
```