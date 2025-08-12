terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5fbead97-423e-4814-809c-114db991d911"

}

resource "azurerm_resource_group" "rg" {
  name     = "rg-resources3"
  location = "West Europe"
}

resource "azurerm_resource_group" "rx" {
  name     = "rg-resources1"
  location = "West Europe"
}

resource "azurerm_storage_account" "sardl" {
  name                     = "stoage92"
  resource_group_name      = "rg-resources3"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.rg ]
}

