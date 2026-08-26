variable "loadbalancer_name" {
  description = "The name of the load balancer to create."
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which to create the load balancer resources."
  type        = string
}

variable "global_ip_name" {
  description = "The name of the global IP to create."
  type        = string
}

variable "backend_pool" {
  description = "The name of the backend service to create."
  type        = string
}

variable "health_check_id" {
  description = "The ID of the health check to attach to the load balancer."
  type        = string
}

variable "backend_instance_group" {
  description = "The instance group ID that the backend service should target."
  type        = string
}