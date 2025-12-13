# DB Subnet Group
resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnet-${var.environment}"
  subnet_ids = var.private_subnets

  tags = {
    Name = "${var.project_name}-db-subnet-${var.environment}"
  }
}

# RDS PostgreSQL Instance
resource "aws_db_instance" "postgres" {
  identifier     = "${var.project_name}-db-${var.environment}"
  engine         = "postgres"
  engine_version = "15.5"
  instance_class = "db.t3.micro" # Free tier eligible

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  vpc_security_group_ids = [var.app_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  publicly_accessible = false
  multi_az            = false # Set to true for production

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot       = true # Set to false for production
  final_snapshot_identifier = "${var. project_name}-db-final-snapshot-${var.environment}"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  auto_minor_version_upgrade = true
  deletion_protection        = false # Set to true for production

  performance_insights_enabled = false # Enable for production monitoring

  tags = {
    Name = "${var.project_name}-db-${var.environment}"
  }
}