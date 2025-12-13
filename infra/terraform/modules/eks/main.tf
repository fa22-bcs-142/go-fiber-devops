# Lightweight EKS module stub for validation (no real AWS resources).
# It exposes outputs derived from inputs so root outputs can reference them.
locals {
  cluster_id       = var.cluster_name
  cluster_endpoint = "https://${var.cluster_name}.local"
}

# No AWS resources here; this keeps 'terraform validate' working without AWS.