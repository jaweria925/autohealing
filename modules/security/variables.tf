variable "project_id" {
  description = "The ID of the project in which to create the network resources."
  type        = string
}

variable "region" {
  description = "The region in which to create the network resources."
  type        = string
}

variable "network_id" {
  description = "The ID of the VPC network to attach firewall rules to."
  type        = string
}

variable "target_tags" {
  description = "The target tags to be applied to the resources."
  type        = list(string)
}

variable "firewall_name" {
  description = "The name of the firewall rule to create."
  type        = string
}

variable "health_check_range" {
  description = "The source ranges allowed for health check traffic."
  type        = list(string)

  default = [
    "35.191.0.0/16",
    "130.211.0.0/22"
  ]
}

