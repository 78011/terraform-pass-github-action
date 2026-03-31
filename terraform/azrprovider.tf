# azrprovider.tf
terraform {
    required_version = ">= 1.9.0"

    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.0"   # CHANGÉ : était ~> 2.46
        }
    }

    # Backend Azure — inchangé, tes valeurs fonctionnent
    backend "azurerm" {
        resource_group_name  = "rg-gc-azr-tf"
        storage_account_name = "tfstateousmanedione2026"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
  # Les credentials viennent des variables d'environnement
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
}
