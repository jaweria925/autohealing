output "public-ip" {
  value = google_compute_global_address.iac_global_ip.address
}

output "backend_pool_id" {
  value       = google_compute_backend_service.iac_backend_pool.id
  description = "The ID of the created backend pool."
}

output "backend_pool_name" {
  value       = google_compute_backend_service.iac_backend_pool.name
  description = "The name of the created backend pool."
}