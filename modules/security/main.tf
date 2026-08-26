resource "google_compute_firewall" "iac_firewall" {
  name    = var.firewall_name
  project = var.project_id
  network = var.network_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}

# Health check for the firewall rule
resource "google_compute_firewall" "iac_health_check_firewall" {
  name    = "${var.firewall_name}-health-check"
  project = var.project_id
  network = var.network_id

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.health_check_range
  target_tags   = var.target_tags
}
