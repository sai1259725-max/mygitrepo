# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "south india"
}

module "vnet" {
  source = "./Modules/Vnet-module"
  rgname = azurerm_resource_group.rg.name
  vnetname = "Sai-Vnet"
  rglocation = azurerm_resource_group.rg.location
}

module "vnet2" {
  source = "./Modules/Vnet-module"
  rgname = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  vnetname = "Ramya-Vnet"

}


module "vm" {
  source = "./Modules/Vm-module"
  rgname = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  subnetid = module.vnet2.subnetid
  vmsize = "Standard_D2as_v5"
  vmname = "Dev-Vm"
  vmusername = "Sai"
  vmpassword = "Puligundla@2025"
  
}

/*
module "vm1" {
  source = "./Modules/Vm-module"
  rgname = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  subnetid = module.vnet2.subnetid
  vmsize = "Standard_D2as_v5"
  vmname = "Prod-Vm"
  vmusername = "Sai"
  vmpassword = "Puligundla@2025"
  
}
*/

/*
module "vm1" {
  source = "./Modules/Vm-module"
  rgname = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  subnetid = module.vnet2.subnetid
  vmsize = "Standard_D2as_v5"
  vmname = "Linux-Vm"
  vmusername = "Sai"
  vmpassword = "Puligundla@2025"
  
}
*/

module "linux_vm1" {
  source     = "./Modules/Linux-Module"
  vmname     = "Dev-Linux"
  rgname     = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  subnetid   = module.vnet.subnetid      # pass the subnet id (from your vnet module)
  vmsize     = "Standard_D2s_v3"
   vmusername = "sai"
  vmpassword = "Puligundla@2025"
}

# New Feature: updated by Sai Prasad





----------------------------------------------------------------------------------------------------------------------------------

/*
module "vm1" {
  source = "./Modules/Vm-module"
  rgname = azurerm_resource_group.rg.name
  rglocation = azurerm_resource_group.rg.location
  subnetid = module.vnet2.subnetid
  vmsize = "Standard_D2as_v5"
  vmname = "Linux-Vm"
  vmusername = "Sai"
  vmpassword = "Puligundla@2025"
  
}
 