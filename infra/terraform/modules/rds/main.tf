locals {
  # use trimspace to remove whitespace when deciding empty/filled strings
  effective_username = length(trimspace(var.username)) > 0 ? var.username : var.db_username
  effective_password = length(trimspace(var.password)) > 0 ? var.password : var.db_password

  effective_subnets    = length(var.subnet_ids) > 0 ? var.subnet_ids : var.private_subnets
  effective_identifier = length(trimspace(var.identifier)) > 0 ? var.identifier : "${var.project_name}-${var.environment}-db"

  simulated_endpoint = "${local.effective_identifier}.db.local"
}

# No AWS resources here: keeps terraform validate working without credentials.