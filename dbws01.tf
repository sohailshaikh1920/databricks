
######################################################
# CONFIGURE DataBricks workspace
######################################################


resource "azurerm_databricks_workspace" "dbws01" {
  name                                  = "${var.subscriptionname}-test-ws01"
  resource_group_name                   = azurerm_resource_group.workload.name
  location                              = azurerm_resource_group.workload.location
  sku                                   = "premium"
  public_network_access_enabled         = false
  network_security_group_rules_required = "NoAzureDatabricksRules"
  customer_managed_key_enabled          = true
  custom_parameters {
    no_public_ip        = true
    virtual_network_id  = azurerm_virtual_network.vnet.id
    private_subnet_name = azurerm_subnet.subnet1.name
    public_subnet_name  = azurerm_subnet.subnet2.name

    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.subnet1.id
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.subnet2.id

  }

  managed_resource_group_name = "${var.resourcegroupname}-managed"

  tags = {

  }

  depends_on = [
    azurerm_subnet_network_security_group_association.subnet1,
    azurerm_subnet_network_security_group_association.subnet2
  ]
}

######################################################
#  Private DNS data source
######################################################

data "azurerm_private_dns_zone" "databricks" {
  name                = "privatelink.azuredatabricks.net"
  resource_group_name = "nf-dns-prod"
  provider            = azurerm.pdns
}

######################################################
# Private endpoint for AAD SSO and UI access
######################################################

resource "azurerm_private_endpoint" "workspaceui" {
  name                          = "workspaceui-pe"
  custom_network_interface_name = "workspaceui-pe-nic"
  resource_group_name           = azurerm_resource_group.workload.name
  location                      = azurerm_resource_group.workload.location
  subnet_id                     = azurerm_subnet.subnet3.id

  private_service_connection {
    name                           = "${azurerm_databricks_workspace.dbws01.name}-workspaceui"
    private_connection_resource_id = azurerm_databricks_workspace.dbws01.id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }

  private_dns_zone_group {
    name                 = "${azurerm_databricks_workspace.dbws01.name}-pe-dbtest"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.databricks.id]
  }
}


resource "azurerm_private_endpoint" "aadauth" {
  name                          = "aadauth-pe"
  custom_network_interface_name = "aadauth-pe-nic"
  resource_group_name           = azurerm_resource_group.workload.name
  location                      = azurerm_resource_group.workload.location
  subnet_id                     = azurerm_subnet.subnet3.id

  private_service_connection {
    name                           = "${azurerm_databricks_workspace.dbws01.name}-aadauth"
    private_connection_resource_id = azurerm_databricks_workspace.dbws01.id
    is_manual_connection           = false
    subresource_names              = ["browser_authentication"]
  }

  private_dns_zone_group {
    name                 = "${azurerm_databricks_workspace.dbws01.name}-pe-dbtest"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.databricks.id]
  }
}


