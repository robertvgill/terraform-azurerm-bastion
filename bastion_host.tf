resource "azurerm_bastion_host" "bst" {
  count                  = var.bst_bastion_create ? 1 : 0

  name                   = lower(var.bst_bastion_name)
  resource_group_name    = var.rg_resource_group_name
  location               = var.rg_location
  copy_paste_enabled     = var.bst_enable_copy_paste
  file_copy_enabled      = var.bst_bastion_host_sku == "Standard" ? var.bst_enable_file_copy : null
  sku                    = var.bst_bastion_host_sku
  ip_connect_enabled     = var.bst_enable_ip_connect
  scale_units            = var.bst_bastion_host_sku == "Standard" ? var.bst_scale_units : 2
  shareable_link_enabled = var.bst_bastion_host_sku == "Standard" ? var.bst_enable_shareable_link : null
  tunneling_enabled      = var.bst_bastion_host_sku == "Standard" ? var.bst_enable_tunneling : null
  tags                   = merge({ "ResourceName" = lower(var.bst_bastion_name) }, var.tags, )

  ip_configuration {
    name                 = "${lower(var.bst_bastion_name)}-network"
    subnet_id            = azurerm_subnet.bst["bst"].id
    public_ip_address_id = azurerm_public_ip.bst_pip[0].id
  }
}