output "image_name" {
    value = data.google_compute_image.ubuntu.name
}
output "instance_group_id" {
    value = google_compute_instance_group_manager.iac_instance_group.id
    description = "The ID of the created managed instance group."
}

output "instance_group" {
    value = google_compute_instance_group_manager.iac_instance_group.instance_group
    description = "The instance group of the created managed instance group."
}