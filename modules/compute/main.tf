data "google_compute_image" "ubuntu" {
    family  = var.image_family
    project = var.image_project
}
resource "google_compute_instance_template" "iac_instance_template" {
    name_prefix = "iac-instance-template-"
    machine_type = var.machine_type
    tags = var.target_tags

    disk {
        source_image = data.google_compute_image.ubuntu.self_link
        auto_delete  = true
        boot         = true
    }

    network_interface {
        subnetwork = var.subnet_id
        access_config {}
    }

    metadata = {
        startup-script = file("${path.module}/startup.sh")
    }

    lifecycle {
        create_before_destroy = true
    }
}
# create the managed instance group
resource "google_compute_instance_group_manager" "iac_instance_group" {
    name               = var.mig_name
    base_instance_name = "${var.instance_name}-"
    version {
        instance_template = google_compute_instance_template.iac_instance_template.self_link
        name              = "v1"
    }
    target_size        = var.target_size
    zone               = var.zone

    update_policy {
        type                         = "PROACTIVE"
        minimal_action               = "REPLACE"
        max_unavailable_fixed        = 0
        max_surge_fixed              = 1
        replacement_method           = "SUBSTITUTE"
    }

    named_port {
        name = "http"
        port = 80
    }

    auto_healing_policies {
        health_check      = var.health_check_id
        initial_delay_sec = 300
    }
}


