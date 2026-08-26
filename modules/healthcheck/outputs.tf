output "health_check_name" {
  value       = google_compute_health_check.iac_health_check.name
  description = "The name of the health check created."
}

output "health_check_id" {
  value       = google_compute_health_check.iac_health_check.id
  description = "The ID of the health check created."
}