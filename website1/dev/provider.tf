########## Setup our aws provider
provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  region     = var.AWS_REGION
}

########## Backend s3
terraform {
  backend "s3" {
    bucket  = "engie-francerenouvelables-hq-noprod-terraform-state"
    key     = "ecs/wordpress/dev/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}