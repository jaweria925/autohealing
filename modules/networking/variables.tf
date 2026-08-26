variable "project_id" {
  description = "The ID of the project in which to create the network resources."
  type        = string
}
variable "region" {
  description = "The region in which to create the network resources."
  type        = string
}
variable "vnetwork_name" {
  description = "The name of the network to create."
  type        = string
}
variable "subnet_name" {
  description = "The name of the subnet to create."
  type        = string
}
variable "subnet_ip_range" {
  description = "The IP range of the subnet to create."
  type        = string
}