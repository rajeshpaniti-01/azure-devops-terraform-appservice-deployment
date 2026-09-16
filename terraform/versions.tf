terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 5.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf_state_rg"
    storage_account_name = "expressapptfstate2026"
    container_name       = "tfstate"
    key                  = "express-app.tfstate"

    use_azuread_auth = true
  }
}
