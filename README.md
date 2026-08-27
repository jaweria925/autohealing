# Auto-Healing Web Tier on Google Cloud

This project provisions a resilient web tier on Google Cloud using Terraform only. It creates a VPC, firewall rules, health checks, a managed instance group, and a global HTTP load balancer. The design is built to satisfy the self-healing and high-availability requirements for a basic production-style stateless web tier.



## Requirements covered

1. Self-healing
   - The managed instance group automatically replaces unhealthy or terminated instances.
   - Health checks are configured so the platform detects failed instances and restores capacity.

2. Self-provisioning (IaC only)
   - The environment is created through Terraform modules.
   - A second `terraform apply` should converge without making additional changes if the infrastructure already exists.

3. N + 1 capacity
   - The compute layer is configured with a minimum target size of at least two instances.
   - Requests are distributed behind the Google Cloud load balancer.

4. Static web page
   - Each VM boots using a startup script that installs and runs a simple NGINX page.
   - The default page is a basic welcome page served on port 80.

5. Templates
   - Reusable Terraform modules are in the `modules/` directory.
   - Variables are separated into module-level definitions and root inputs.

## Architecture

- Google VPC and subnet
- Firewall rules for HTTP ingress and GCP health checks
- Managed instance group for VM lifecycle and self-healing
- Global HTTP(S) load balancer for traffic distribution
- Health check for backend availability


## Prerequisites

- Terraform 1.13.x or newer compatible with the project constraint
- Google Cloud project
- Google Cloud CLI (`gcloud`) configured locally
- A service account or Workload Identity Federation setup for GitHub Actions if you plan to automate deployment
- Docker (optional, for containerized page deployment)

## Google Cloud setup

1. Create or select a Google Cloud project.
2. Enable required APIs:
   - Compute Engine API
   - Identity and Access Management API
3. Configure authentication for Terraform.
4. Set values in `terraform.tfvars` or environment variables.

## Quick start

```bash
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

After deployment, Terraform will output the relevant service endpoints and load balancer information.

## Test auto-healing

1. Identify one VM in the instance group.
2. Stop or terminate it from the Google Cloud Console or CLI.
3. Observe that the managed instance group replaces it automatically.
4. Check that the load balancer continues to serve traffic without downtime.

##  containerized page

This repository includes a `Dockerfile` that can be used to package the static page or a containerized web app.

Example:

```bash
docker build -t ghcr.io/<your-user>/my-app:v1 .
docker run -d -p 80:80 ghcr.io/<your-user>/my-app:v1
```

For GitHub Actions, the workflow can be extended to build and push the image to GHCR and then deploy it to each VM as part of startup configuration.

## CI/CD

The GitHub Actions workflow in `.github/workflows/iac-ci.yaml` validates the Terraform configuration and runs a plan. This provides a lightweight pipeline for code validation before deployment.

## Notes on security and IAM

When running Terraform in GitHub Actions, make sure the service account has the required permissions to manage Google Cloud resources. For Workload Identity Federation, the provider trust and service account impersonation permissions must be correctly configured.

## Deliverables included

- Terraform infrastructure modules
- Naming and tagging conventions
- Resource grouping and modularization
- Load balancer and health-check wiring
- NGINX-based static web page
- Docker support for optional containerization
- GitHub Actions validation pipeline
- README documentation

## Example of one-command repeatable deployment

```bash
terraform init && terraform validate && terraform plan && terraform apply -auto-approve
```

This is intended to be a repeatable, idempotent deployment model where a second run should converge without creating drift or extra resources.

## Summary

This project demonstrates an auto-healing, self-provisioning web tier on Google Cloud with layered modular Terraform code, health-based replacement, and a global load balancer for stateless web traffic.


## Incremental Scripts
c8103d5 (HEAD -> main, origin/main) update theoutput.tf file
75a77b4 update theoutput.tf file
5a106cc Merge remote-tracking branch 'origin/main'
ec50f96 update script and modules file
cd9f64a Iac-autohealing Diagram.drawio
945ba7c add gcp credentials
a6d5347 add gcp credentials
