

################################################
# Central Log Analytics Subscription
################################################

provider "azurerm" {
  subscription_id = var.subscriptionid_mgt
  features {}
  alias                      = "pmgt"
  skip_provider_registration = true
}

################################################
# Autenticate to Azure on Spoke subscription
################################################

provider "azurerm" {
  subscription_id = var.subscriptionid
  features {}
  skip_provider_registration = true
}

################################################
# Hub Subscription
################################################

provider "azurerm" {
  subscription_id = var.subscriptionid_vdchub
  features {}
  alias                      = "phub"
  skip_provider_registration = true
}

################################################
# DNS Subscription
################################################

provider "azurerm" {
  subscription_id = var.subscriptionid_pdns
  features {}
  alias                      = "pdns"
  skip_provider_registration = true
}
