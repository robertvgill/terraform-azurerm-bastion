## resource group
variable "rg_resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = null
}

variable "rg_location" {
  description = "Specifies the supported Azure location where the resource should be created."
  type        = string
  default     = null
}

## vnet
variable "nw_virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

## azure bastion
variable "bst_bastion_create" {
  description = "Controls if Azure Bastion Host should be created."
  type        = bool
}

variable "bst_bastion_name" {
  description = "Specifies the name of the Bastion Host."
  default     = ""
}

variable "bst_bastion_subnet" {
  description = "Create a network subnet for the Bastion Host."
  default     = {}
}

variable "bst_enable_copy_paste" {
  description = "Is Copy/Paste feature enabled for the Bastion Host?"
  default     = true
}

variable "bst_enable_file_copy" {
  description = "Is File Copy feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`."
  default     = false
}

variable "bst_bastion_host_sku" {
  description = "The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`."
  default     = "Standard"
}

variable "bst_enable_ip_connect" {
  description = "Is IP Connect feature enabled for the Bastion Host?"
  default     = false
}

variable "bst_scale_units" {
  description = "The number of scale units with which to provision the Bastion Host. Possible values are between `2` and `50`. `scale_units` only can be changed when `sku` is `Standard`. `scale_units` is always `2` when `sku` is `Basic`."
  default     = 5
}

variable "bst_enable_shareable_link" {
  description = "Is Shareable Link feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`."
  default     = false
}

variable "bst_enable_tunneling" {
  description = "Is Tunneling feature enabled for the Bastion Host. Only supported whne `sku` is `Standard`."
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}