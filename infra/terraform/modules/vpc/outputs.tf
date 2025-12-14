output "vpc_id" {
  description = "Simulated VPC id (for validation)"
  value       = local.vpc_id
}

output "public_subnets" {
  description = "List of simulated public subnet ids"
  value       = local.public_subnets
}

output "private_subnets" {
  description = "List of simulated private subnet ids"
  value       = local.private_subnets
}