
###############################################################
# Create a spoke firewall collection rule on central firewall 
###############################################################
#
# Rule suffix can be found on these links
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_application_rule_collection
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/firewall_network_rule_collection
#

################################################
# Network Workload Rules
################################################

resource "azurerm_firewall_policy_rule_collection_group" "spoke" {
  provider           = azurerm.phub
  name               = "${var.subscriptionname}-test"
  priority           = var.firewall_rules_collection_group_priority
  firewall_policy_id = data.azurerm_firewall.firewall.firewall_policy_id

  network_rule_collection {
    name     = "Network-Allow-${var.subscriptionname}"
    priority = 100
    action   = "Allow"

    
    rule {
      name                  = "AllowDatabricksurlfrompublicsubnet" // Allow traffic to Databricks services
      protocols             = ["UDP","TCP"]
      source_addresses      = ["172.23.9.0/25"] // Public subnet
      destination_addresses = ["*"]         // Internet
      destination_ports     = ["1-65000"]                 // All
    }

    
    
    
  }

  ################################################
  # Application Workload Rules
  ################################################
  
  application_rule_collection {
    name     = "Application-Allow-${var.subscriptionname}"
    priority = 200
    action   = "Allow"

    ## Source: privateendpoint subnet

    rule {
      name = "AllowDatabricksurlfrompublicsubnet" // Allow traffic to Databricks services
      protocols {
        type = "Https"
        port = "443"
      }
      protocols {
        type = "Http"
        port = "80"
      }
      source_addresses = ["172.23.9.0/25"]
      destination_fqdns = ["*"]
    }

   
  } 
}


