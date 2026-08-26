resource "google_compute_global_address" "iac_global_ip" {
  name    = var.global_ip_name
  project = var.project_id
}

# create map url 
resource "google_compute_url_map" "iac_url_map" {
  name    = var.loadbalancer_name
  project = var.project_id

  default_service = google_compute_backend_service.iac_backend_pool.id
}


# create backend pool
resource "google_compute_backend_service" "iac_backend_pool" {
  name                  = var.backend_pool
  project               = var.project_id

  load_balancing_scheme = "EXTERNAL"

  health_checks = [var.health_check_id]

  backend {
    group = var.backend_instance_group
  }
}

# create target http proxy
resource "google_compute_target_http_proxy" "iac_target_http_proxy" {
  name    = "${var.loadbalancer_name}-http-proxy"
  project = var.project_id

  url_map = google_compute_url_map.iac_url_map.id
}

#forwarding rule
resource "google_compute_global_forwarding_rule" "iac_forwarding_rule" {
  name    = "${var.loadbalancer_name}-forwarding-rule"
  project = var.project_id

  ip_address = google_compute_global_address.iac_global_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.iac_target_http_proxy.id
}