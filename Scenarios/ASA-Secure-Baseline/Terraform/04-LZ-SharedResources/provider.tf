# Azure provider version 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "= 3.32.0"
    }

    http = {
      source = "hashicorp/http"
      version = "= 3.2.1"
    }
  }

  backend "azurerm" {
    # resource_group_name  = ""   # Partial configuration, provided during "terraform init"
    # storage_account_name = ""   # Partial configuration, provided during "terraform init"
    # container_name       = ""   # Partial configuration, provided during "terraform init"
    key                  = "lz-sharedresources"
  }

}

provider "azurerm" {
    features {
     resource_group {
       prevent_deletion_if_contains_resources = false
     }
     log_analytics_workspace {
      permanently_delete_on_destroy = true
     }
    } 
}

provider "azurerm" {
    alias = "hub-subscription"
    subscription_id = local.hub_subscriptionId
    features {
    } 
}