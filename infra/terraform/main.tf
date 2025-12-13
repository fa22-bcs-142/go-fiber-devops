# VPC Module
module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var. vpc_cidr
  availability_zones = var.availability_zones
}

# RDS Module
module "rds" {
  source = "./modules/rds"

  project_name    = var.project_name
  environment     = var.environment
  db_name         = var.db_name
  db_username     = var. db_username
  db_password     = var.db_password
  vpc_id          = module.vpc. vpc_id
  private_subnets = module.vpc.private_subnets
  app_sg_id       = module.vpc. app_security_group_id
}

# EKS Module
module "eks" {
  source = "./modules/eks"
  count  = var.enable_eks ?  1 : 0

  project_name         = var.project_name
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module. vpc.private_subnets
  node_instance_types  = var. eks_node_instance_types
  desired_size         = var. eks_desired_size
  min_size             = var.eks_min_size
  max_size             = var.eks_max_size
}