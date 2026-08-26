output "firewall_name" {
    value       = google_compute_firewall.iac_firewall.name
    description = "The name of the created firewall rule."
}

output "health_check_firewall_name" {
    value       = google_compute_firewall.iac_health_check_firewall.name
    description = "The name of the created health check firewall rule."
}