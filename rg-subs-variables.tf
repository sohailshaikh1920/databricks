variable "resourcegroupname" {
  type        = string
  description = "Name of the reource group for the workload"
}

variable "location" {
  type        = string
  default     = "northeurope"
  description = "Name of the Azure region that the workload will reside in"
}

variable "central_log_analytics_workspace_name" {
  type        = string
  description = "Name of the central platform monitoring Log Analytics Workspace"
}

variable "managementgroup" {
  type        = string
  description = "Management Group under which current subscription needs to be added"
}

variable "subscriptionname" {
  type        = string
  description = "Name of the subscription for the workload"
}

variable "subscriptionid" {
  type        = string
  description = "ID of the subscription for the workload"
}

variable "subscriptionid_mgt" {
  type        = string
  description = "Subscription ID of the p-mgt subscription"
}

variable "subscriptionid_pdns" {
  type        = string
  description = "Subscription ID of the p-mgt subscription"
}


variable "subscriptionid_vdchub" {
  type        = string
  description = "Subscription ID of the VDC instance Hub subscription"
}


##################################################
#  VDC instance hub virtual network
##################################################

variable "hub_virtual_network_name_resource_group" {
  type        = string
  description = "Name of the resource group containing the VDC instance hub virtual network"
}

variable "hub_virtual_network_name" {
  type        = string
  description = "Name of the VDC instance hub virtual network"
}

variable "firewall_resource_group" {
  type        = string
  description = "Name of the resource group containing the VDC instance hub firewall"
}

variable "firewall_name" {
  type        = string
  description = "Name of the VDC isntance hub firewall"
}

variable "firewall_ipaddress" {
  type        = string
  description = "IP Address of the VDC isntance hub firewall"
}
