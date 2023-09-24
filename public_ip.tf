resource "azurerm_public_ip" "bst_pip" {
  count  = var.bst_bastion_create ? 1 : 0

  name                = lower("pip-${var.bst_bastion_name}")
  resource_group_name = var.rg_resource_group_name
  location            = var.rg_location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = lower("pip-${var.bst_bastion_name}")
  tags                = merge({ "ResourceName" = lower("pip-${var.bst_bastion_name}") }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags,
      ip_tags,
    ]
  }
}