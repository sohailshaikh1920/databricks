
######################################################
# Central loganalytics data source
######################################################

data "azurerm_log_analytics_workspace" "central" {
  name                = var.central_log_analytics_workspace_name
  resource_group_name = "nf-mgnt-prod-rg"
  provider            = azurerm.pmgt
}

######################################################
# Get Tenant and current subscription details
######################################################

data "azurerm_client_config" "current" {}

################################################################
# Get Management Group under which current Sub needs to be added
################################################################

data "azurerm_management_group" "managementgroup" {
  name = var.managementgroup
}



################################################################
# Get Hub Virtual Network
################################################################

data "azurerm_virtual_network" "hub" {
  name                = var.hub_virtual_network_name
  resource_group_name = var.hub_virtual_network_name_resource_group
  provider            = azurerm.phub
}



################################################################
# Get Network Firewall 
################################################################

data "azurerm_firewall" "firewall" {
  name                = var.firewall_name
  resource_group_name = var.firewall_resource_group
  provider            = azurerm.phub
}


