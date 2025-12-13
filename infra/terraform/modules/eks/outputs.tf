output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster. main.id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster. main.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster. main.endpoint
  sensitive   = true
}

output "cluster_version" {
  description = "EKS cluster version"
  value       = aws_eks_cluster. main.version
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN of the EKS cluster"
  value       = aws_iam_role.cluster.arn
}

output "node_group_id" {
  description = "EKS node group ID"
  value       = aws_eks_node_group.main.id
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = aws_iam_openid_connect_provider.cluster.arn
}