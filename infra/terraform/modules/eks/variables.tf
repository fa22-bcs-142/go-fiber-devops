variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
  default = []
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 1
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "tags" {
  type    = map(string)
  default = {}
}