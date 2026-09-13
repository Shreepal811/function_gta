terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "testRG"
      storage_account_name = "mysa12"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
}
}



provider "azurerm" {
  features {}
}


