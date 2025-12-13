# VPC Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = module. vpc.vpc_cidr
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

# RDS Outputs
output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds. db_endpoint
  sensitive   = true
}

output "rds_database_name" {
  description = "RDS database name"
  value       = module.rds. db_name
}

output "rds_port" {
  description = "RDS port"
  value       = module.rds.db_port
}

# EKS Outputs
output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = var.enable_eks ? module.eks[0].cluster_name : null
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = var.enable_eks ? module.eks[0].cluster_endpoint : null
  sensitive   = true
}

output "eks_cluster_version" {
  description = "EKS cluster version"
  value       = var.enable_eks ?  module.eks[0].cluster_version : null
}

# Instructions
output "next_steps" {
  description = "Next steps after Terraform apply"
  value = <<-EOT
    ========================================
    ✅ Infrastructure Deployed Successfully!
    ========================================
    
    Next Steps:
    
    1. Configure kubectl for EKS: 
       aws eks update-kubeconfig --region ${var.aws_region} --name ${var.project_name}-eks-${var.environment}
    
    2. Verify EKS connection:
       kubectl get nodes
    
    3. Database endpoint (save this):
       ${module.rds.db_endpoint}
    
    4. Deploy to Kubernetes:
       kubectl apply -f ../../k8s/
    
    5. Don't forget to run 'terraform destroy' when done testing to avoid charges!
    
    ========================================
  EOT
}