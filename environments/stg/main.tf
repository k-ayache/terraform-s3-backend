provider "aws" {
   version = ">= 2.38"
   region = "us-west-2"
   profile = "default"
#  path tot aws cred or env variables
}

terraform {
 required_version = ">= 0.12"
 backend "s3" {
 encrypt = true
 bucket = "${var.env}-terraform-backend-store"
 region = "us-west-2"
 workspace_key_prefix = "environment"
 key = "tfstate"
 }
}

resource "aws_s3_bucket" "assets" {
#  count  = "${var.env == "production" ? 1 : 0}"
  count = length(var.env)
  bucket = "${var.env[count.index]}-this-is-test-assets.spyscape.net"
}
