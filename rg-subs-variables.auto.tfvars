resourcegroupname                    = "nf-digplt-databricks-test"
location                             = "northeurope"
central_log_analytics_workspace_name = "nf-mgnt-lawdata7xqjjx-ws"
managementgroup                      = "Databricks"
subscriptionname                     = "nf-digplt-databricks"
subscriptionid                       = "9e38e1cd-8318-49b8-90ec-05ded385d973"
subscriptionid_mgt                   = "4ecc925c-1720-459d-b427-1d8adb08cb7e" // LAW subscription id
subscriptionid_pdns                  = "7f9479b3-63ac-44cf-98c3-81acb2929f07"
subscriptionid_vdchub                = "388c546b-d108-4c9f-ae28-8825e5bc0fc7"

##################################################
#  VDC instance hub virtual network
##################################################

hub_virtual_network_name_resource_group = "nf-scatechub-prod-network"
hub_virtual_network_name                = "nf-scatechub-prod-network-vnet"

firewall_resource_group = "nf-scatechub-prod-network"
firewall_name           = "nf-scatechub-prod-network-fw"
firewall_ipaddress      = "172.23.0.4"