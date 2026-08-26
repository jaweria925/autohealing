module "networking" {
  source = "./modules/networking"

  project_id      = var.project_id
  region          = var.region
  vnetwork_name   = "iac-vnetwork"
  subnet_name     = "iac-subnet"
  subnet_ip_range = "10.10.0.0/24"
}

module "security" {
  source = "./modules/security"

  project_id    = var.project_id
  region        = var.region
  network_id    = module.networking.vnetwork_id
  target_tags   = ["web-server"]
  firewall_name = "iac-firewall"
}


module "healthcheck" {
  source = "./modules/healthcheck"
  project_id = var.project_id
  health_check_name = "iac-health-check"
}

module "compute" {
  source = "./modules/compute"
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone

  mig_name =  "iac-mig"
  instance_name   = "iac-instance"
  instance_template_name = "iac-instance-template"

  machine_type    = "e2-micro"
  image_family    = "ubuntu-2204-lts"
  image_project   = "ubuntu-os-cloud"

  network_id      = module.networking.vnetwork_id
  subnet_id       = module.networking.subnet_id

  target_tags     = ["web-server"]
  health_check_id = module.healthcheck.health_check_id
}



module "loadbalancer" {
  source = "./modules/loadbalancer"
  loadbalancer_name    = "iac-load-balancer"
  global_ip_name       = "iac-global-ip"
  backend_pool         = "iac-backend-pool"
  project_id           = var.project_id
  health_check_id      = module.healthcheck.health_check_id
  backend_instance_group = module.compute.instance_group_id
}

