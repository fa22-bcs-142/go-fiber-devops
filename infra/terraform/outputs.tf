output "vpc_id" {
  description = "VPC ID from vpc module (stub or real)"
  value       = try(module.vpc.vpc_id, "")
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint (stub)"
  value       = try(module.eks.cluster_endpoint, "")
}

output "eks_cluster_name" {
  description = "EKS cluster name (stub)"
  value       = try(module.eks.cluster_id, "")
}

output "rds_endpoint" {
  description = "RDS endpoint (stub)"
  value       = try(module.rds.db_instance_endpoint, "")
}

output "rds_database_name" {
  description = "RDS database name (stub)"
  value       = try(module.rds.db_name, "")
}