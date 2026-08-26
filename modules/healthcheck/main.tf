resource "google_compute_health_check" "iac_health_check" {
  name               = var.health_check_name
  project            = var.project_id
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold  = 2


  http_health_check {
    port = 80
    request_path = "/"
  }
}