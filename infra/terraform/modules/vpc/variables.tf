variable "vpc_cidr" {
  description = "CIDR for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of AZs"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = []
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Optional tags map"
  type        = map(string)
  default     = {}
}