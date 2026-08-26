output "vnetwork_id" {
  value       = google_compute_network.iac_vnetwork.id
  description = "The ID of the created VPC network."
}

output "subnet_id" {
  value       = google_compute_subnetwork.iac_subnet.id
  description = "The ID of the created subnet."
}