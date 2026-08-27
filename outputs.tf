output "load_balancer_ip" {
  description = "Public IP address of the global HTTP load balancer."
  value       = module.loadbalancer.public-ip
}

output "instance_group_name" {
  description = "Managed instance group name behind the load balancer."
  value       = module.compute.instance_group
}
