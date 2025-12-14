# Lightweight VPC module stub for validation (no real AWS resources).
# This module accepts CIDR lists and returns simple outputs that other modules expect.

locals {
  # Echo incoming subnet CIDRs as "simulated subnet ids" for validation purposes.
  public_subnets  = [for idx, c in var.public_subnet_cidrs : "public-subnet-${idx + 1}-${replace(c, "/", "-")}"]
  private_subnets = [for idx, c in var.private_subnet_cidrs : "private-subnet-${idx + 1}-${replace(c, "/", "-")}"]

  vpc_id = "${var.project_name != "" ? var.project_name : "vpc"}-${var.environment != "" ? var.environment : "dev"}"
}

# No AWS resources — keeps terraform validate and CI passing without AWS credentials.