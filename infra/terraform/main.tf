module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project_name         = var.project_name
  environment          = var. environment
}

module "eks" {
  source = "./modules/eks"

  cluster_name   = "${var.project_name}-${var.environment}-cluster"
  subnet_ids     = concat(module.vpc.public_subnets, module.vpc.private_subnets)
  desired_size   = var.eks_desired_size
  max_size       = var.eks_max_size
  min_size       = var.eks_min_size
  instance_types = var. eks_node_instance_types

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  depends_on = [module.vpc]
}

module "rds" {
  source = "./modules/rds"

  identifier          = "${var.project_name}-${var.environment}-db"
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  instance_class      = var.db_instance_class
  allocated_storage   = var.db_allocated_storage
  subnet_ids          = module.vpc. private_subnets
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks = var. private_subnet_cidrs

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  depends_on = [module. vpc]
}