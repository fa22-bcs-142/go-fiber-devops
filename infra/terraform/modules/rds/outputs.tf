output "db_instance_endpoint" {
  description = "Simulated RDS endpoint (for validation)"
  value       = local.simulated_endpoint
}

output "db_name" {
  description = "Database name"
  value       = var.db_name
}

output "db_identifier" {
  description = "RDS identifier used (simulated)"
  value       = local.effective_identifier
}

output "db_username" {
  description = "Effective DB username (simulated)"
  value       = local.effective_username
}

# Expose the vpc_id back so root outputs referencing it won't error
output "vpc_id" {
  description = "VPC ID passed into module (simulated echo)"
  value       = var.vpc_id
}