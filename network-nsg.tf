################################################
#  Private Subnet 1 NSG
################################################

resource "azurerm_network_security_group" "subnet1" {
  name                = "${var.subscriptionname}-network-vnet-${azurerm_subnet.subnet1.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name

}


/*
###################################################################
#  Subnet 1 NSG Flow Logs and Traffic Analytics
###################################################################
resource "azurerm_network_watcher_flow_log" "subnet1_flowfront" {
  name                 = "Vnet${azurerm_subnet.subnet1.name}-flowlog"
  location             = var.location
  network_watcher_name = azurerm_network_watcher.network.name
  resource_group_name  = azurerm_resource_group.network.name

  network_security_group_id = azurerm_network_security_group.subnet1.id
  storage_account_id        = azurerm_storage_account.networkdiag.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = true
    days    = 3
  }
  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.central.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.central.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.central.id
    interval_in_minutes   = 10
  }
}

*/

/*
################################################
#  Public Subnet 1 NSG
################################################

resource "azurerm_network_security_group" "subnet2" {
  name                = "${var.subscriptionname}-network-vnet-${azurerm_subnet.subnet2.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name

}





###################################################################
#  Subnet 2 NSG Flow Logs and Traffic Analytics
###################################################################
resource "azurerm_network_watcher_flow_log" "subnet2_flowfront" {
  name                 = "Vnet${azurerm_subnet.subnet2.name}-flowlog"
  location             = var.location
  network_watcher_name = azurerm_network_watcher.network.name
  resource_group_name  = azurerm_resource_group.network.name

  network_security_group_id = azurerm_network_security_group.subnet2.id
  storage_account_id        = azurerm_storage_account.networkdiag.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = true
    days    = 3
  }
  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.central.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.central.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.central.id
    interval_in_minutes   = 10
  }
}

*/

################################################
#  Subnet 3 NSG
################################################

resource "azurerm_network_security_group" "subnet3" {
  name                = "${var.subscriptionname}-network-vnet-${azurerm_subnet.subnet3.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.network.name


  

}

/*
###################################################################
#  Subnet 3 NSG Flow Logs and Traffic Analytics
###################################################################
resource "azurerm_network_watcher_flow_log" "subnet3_flowfront" {
  name                 = "Vnet${azurerm_subnet.subnet3.name}-flowlog"
  location             = var.location
  network_watcher_name = azurerm_network_watcher.network.name
  resource_group_name  = azurerm_resource_group.network.name

  network_security_group_id = azurerm_network_security_group.subnet3.id
  storage_account_id        = azurerm_storage_account.networkdiag.id
  enabled                   = true
  version                   = 2

  retention_policy {
    enabled = true
    days    = 3
  }
  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.central.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.central.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.central.id
    interval_in_minutes   = 10
  }
}

*/
