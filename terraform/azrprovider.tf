terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 2.46" # Version utilisée pour ce projet, tu peux ajuster selon tes besoins
        }
    }

    # La configuration de ton Backend personnel
    backend "azurerm" {
        resource_group_name  = "rg-gc-azr-tf"
        storage_account_name = "tfstateousmanedione2026"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}