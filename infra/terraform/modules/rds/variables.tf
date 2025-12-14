variable "app_sg_id" {
  description = "Security group id used by app to access DB (optional)"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
  default     = ""
}

variable "db_name" {
  description = "Database name (primary)"
  type        = string
  default     = "gofiber"
}

# Two possible username/password names are supported (db_username or username).
variable "db_username" {
  description = "DB username (alternate name)"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "DB password (alternate name)"
  type        = string
  sensitive   = true
  default     = "changeme123"
}

variable "username" {
  description = "DB username (primary name)"
  type        = string
  default     = ""
}

variable "password" {
  description = "DB password (primary name)"
  type        = string
  sensitive   = true
  default     = ""
}

variable "private_subnets" {
  description = "Private subnets (alternate name)"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Subnet IDs (primary name)"
  type        = list(string)
  default     = []
}

variable "identifier" {
  description = "RDS identifier (optional)"
  type        = string
  default     = ""
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "RDS storage GB"
  type        = number
  default     = 20
}

variable "allowed_cidr_blocks" {
  description = "Allowed CIDR blocks for DB inbound"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags for DB"
  type        = map(string)
  default     = {}
}