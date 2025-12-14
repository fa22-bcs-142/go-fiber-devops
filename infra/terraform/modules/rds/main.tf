# Lightweight RDS module stub for validation (no real AWS resources).
# Accepts inputs that root passes and provides simulated outputs so terraform validate passes.

locals {
  # choose effective username/password
  effective_username = length(trim(var.username)) > 0 ? var.username : var.db_username
  effective_password = length(trim(var.password)) > 0 ? var.password : var.db_password

  # prefer subnet_ids, fallback to private_subnets
  effective_subnets = length(var.subnet_ids) > 0 ? var.subnet_ids : var.private_subnets

  effective_identifier = length(trim(var.identifier)) > 0 ? var.identifier : "${var.project_name}-${var.environment}-db"

  simulated_endpoint = "${local.effective_identifier}.db.local"
}

# No AWS resources here - this keeps terraform validate working without credentials.