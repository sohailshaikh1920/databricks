

######################################################
# CONFIGURE TERRAFORM AND THE BACKEND STATE STORAGE
######################################################

terraform {
  required_version = ">= 1.2.8"
  backend "azurerm" {
    resource_group_name  = "nf-iac-prod-rg"
    storage_account_name = "nfiacproddata0q1hz7"
    container_name       = "nf-digplt-datbric-test"
    key                  = "terraform.tfstate"
    subscription_id      = "b914cc57-d671-498a-90d0-6179710db689"
  }
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "= 2.28.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.79.0"
    }
    random = {
      source = "hashicorp/random"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "1.4.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "1.34.0"
    }
  }
}