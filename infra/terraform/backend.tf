terraform {
  backend "s3" {
    bucket         = "nehaghauri-go-fiber-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "go-fiber-terraform-lock"
  }
}