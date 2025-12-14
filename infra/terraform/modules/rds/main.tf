# Lightweight RDS module stub for validation (no real AWS resources).
# This module accepts all expected inputs and returns outputs so root can reference them.

locals {
  # prefer the values passed with the primary names (username/password),
  # fallback to alternate names (db_username/db_password), or defaults.
  effective_username = length(trim(var.username)) > 0 ? var.username : var.db_username
  effective_password = length(trim(var.password)) > 0 ? var.password : var.db_password

  # prefer subnet_ids, fallback to private_subnets
  effective_subnets = length(var.subnet_ids) > 0 ? var.subnet_ids : var.private_subnets

  # identifier fallback
  effective_identifier = length(trim(var.identifier)) > 0 ? var.identifier : "${var.project_name}-${var.environment}-db"

  # Simulated endpoint for validation/test purposes
  simulated_endpoint = "${local.effective_identifier}.db.local"
}

# No real AWS resources here (keeps terraform validate working in CI without credentials).