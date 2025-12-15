# terraform {
#   backend "s3" {
#     bucket         = "nehaghauri-go-fiber-terraform-state"
#     key            = "terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "go-fiber-terraform-lock"
#   }
# }
