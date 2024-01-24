
#################################################
# Create peering on Spoke
#################################################

resource "azurerm_virtual_network_peering" "spoke" {
  name                      = "nf-digplt-datbric-test-network-vnet"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.vnet.name
  remote_virtual_network_id = data.azurerm_virtual_network.hub.id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}



#################################################
# Create peering on Hub
#################################################



resource "azurerm_virtual_network_peering" "hub" {
  provider                  = azurerm.phub #This provider is pointing to the subscription of the p-we1net
  name                      = "${var.subscriptionname}-test-network-vnet"
  resource_group_name       = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.vnet.id #This is the Vnet network ID in this spoke that HUB are to peer with.

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = true
}



