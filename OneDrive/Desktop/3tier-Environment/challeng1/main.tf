# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
    backend "azurerm" {
    subscription_id      = "7f0fe164-a3df-4821-bf3b-53ec9f60e7c4"
    resource_group_name  = "demoResourceGroup"
    storage_account_name = "demostorageaccount82493"
    container_name       = "tfstate"
    key                  = "root.terraform.tfstate"
  }
}



provider "azurerm" {
  features {}
}



resource "azurerm_resource_group" "rg" {
  name     = "Test-resourceGroup"
  location = var.location-rg
  tags = {
    "Application" = "DemoApp"
  }
}


