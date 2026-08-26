variable "project_id" {
  description = "The ID of the project in which to create the compute resources."
  type        = string
}

variable "region" {
  description = "The region in which to create the compute resources."
  type        = string
}
variable "zone" {
  description = "The zone in which to create the compute resources."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet to attach the compute instance to."
  type        = string
}
variable "network_id" {
  description = "The ID of the VPC network to attach the compute instance to."
  type        = string
}

variable "instance_name" {
  description = "The name of the compute instance to create."
  type        = string
}

variable "instance_template_name" {
  description = "The name of the instance template to create."
  type        = string
}

variable "mig_name" {
  description = "The name of the managed instance group to create."
  type        = string
}
variable "machine_type" {
  description = "The machine type of the compute instance."
  type        = string
  default     = "e2-micro"
}

variable "image_family" {
  description = "The image family of the compute instance."
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "target_size" {
  description = "The target size of the managed instance group."
  type        = number
  default     = 2
}

variable "target_tags" {
  description = "The target tags to be applied to the compute instance."
  type        = list(string)
  default     = ["web-server"]
}

variable "health_check_id" {
  description = "The ID of the health check to attach to the managed instance group."
  type        = string
}


variable "image_project" {
  description = "The project in which the image family is located."
  type        = string
  default     = "ubuntu-os-cloud"
}