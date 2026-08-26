resource "google_compute_network" "iac_vnetwork" {
  name                    = var.vnetwork_name
  project                 = var.project_id
  auto_create_subnetworks = false
}
# create subnet
resource "google_compute_subnetwork" "iac_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_range
  region        = var.region
  network       = google_compute_network.iac_vnetwork.id
}