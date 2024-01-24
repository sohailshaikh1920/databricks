
################################################
#  Defining Vnet and Subnets
################################################
resource "azurerm_virtual_network" "vnet" {
  name                = "${azurerm_resource_group.network.name}-vnet"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = [var.vnetaddress]


}


################################################
#  private Subnet 1
################################################

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1Name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet1Prefixes

  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = true

  service_endpoints = var.subnet2ServiceEndpoints

  delegation {
    name = "databricks-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
    }
  }

}

# Attach NSG to subnet
resource "azurerm_subnet_network_security_group_association" "subnet1" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.subnet1.id
}

################################################
#  public Subnet 1
################################################

resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet2Name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet2Prefixes

  delegation {
    name = "databricks-delegation"

    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
      ]
    }
  }

}

# Attach NSG to subnet
resource "azurerm_subnet_network_security_group_association" "subnet2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.subnet1.id
}

################################################
#  Private edpoint Subnet 
################################################

resource "azurerm_subnet" "subnet3" {
  name                                      = var.subnet3Name
  resource_group_name                       = azurerm_resource_group.network.name
  virtual_network_name                      = azurerm_virtual_network.vnet.name
  address_prefixes                          = var.subnet3Prefixes
  service_endpoints                         = var.subnet3ServiceEndpoints
  private_endpoint_network_policies_enabled = true

}

# Attach NSG to subnet
resource "azurerm_subnet_network_security_group_association" "subnet3" {
  subnet_id                 = azurerm_subnet.subnet3.id
  network_security_group_id = azurerm_network_security_group.subnet3.id
}

data "azurerm_resource_group" "dnsrg" {
  name     = "nf-dns-prod"
  provider = azurerm.pdns
}


################################################
#  Setting VNET diagnostics
################################################

resource "azurerm_monitor_diagnostic_setting" "vnet_diagnostic_settings" {
  name                       = data.azurerm_log_analytics_workspace.central.name
  target_resource_id         = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.central.id

  log {
    category = "VMProtectionAlerts"
    enabled  = true
    retention_policy {
      days    = 0
      enabled = false
    }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      days    = 0
      enabled = false
    }
  }
}


