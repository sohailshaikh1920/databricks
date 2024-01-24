##################################################
#  Workload virtual network
##################################################

firewall_rules_collection_group_priority = "1100"
vnetaddress                              = "172.23.8.0/23"
subnet1Name                              = "privatesubnet1"
subnet1Prefixes                          = ["172.23.8.0/25"]
subnet2Name                              = "publicsubnet1"
subnet2Prefixes                          = ["172.23.9.0/25"]
subnet2ServiceEndpoints                  = []
subnet3Name                              = "PrivateEndpointSubnet"
subnet3Prefixes                          = ["172.23.9.128/27"]
subnet3ServiceEndpoints                  = []


