provider "aws" {
   version = ">= 2.38"
   region = var.region
   profile = "default"
#  path tot aws cred or env variables
}

terraform {
 required_version = ">= 0.12"
 backend "s3" {
 encrypt = true
 #bucket = "${var.env}-terraform-backend-store" this doesn't work
 bucket = "dev-terraform-backend-store"
 region = "us-west-2"
 workspace_key_prefix = "environment"
 key = "tfstate"
 }
}

module "aws_s3_bucket" {
source = "../../resources/aws_s3_backet"
  bucket_name = var.bucket_name
}
