terraform fmt = "Make my code look clean and consistent."

terraform validate

Purpose: checking whether your Terraform configuration is valid.

It checks things such as:

Terraform syntax
Resource configuration structure
Variable references
Provider/resource arguments
Internal configuration consistency

Example:


GCP

GCP firewall rules are associated with a VPC network, and they can target specific instances using mechanisms such as network tags or service accounts.


Google Cloud's health-check system sends requests from known IP ranges. We create a firewall rule that allows those IP ranges to contact our web VMs on port 80, so the Load Balancer can determine whether the VMs are healthy.


But for a health check, the source isn't the end user.

The source is Google's health-checking system.

Google Cloud health checkers come from specific IP ranges.

For example, commonly used Google Cloud health-check source ranges include: