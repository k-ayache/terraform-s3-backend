variable "env" {
default = ["dev", "stg", "prod"]
}
provider "aws" {
   version = ">= 2.38"
   region = "us-west-2"
   profile = "default"
}

resource "aws_s3_bucket" "assets" {
  count  = length(var.env)
  bucket = "${var.env[count.index]}-terraform-backend-store"
  acl    = "private"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  count  = length(var.env)
  name           = "${var.env[count.index]}-terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20
attribute {
    name = "LockID"
    type = "S"
  }
}
output "s3_backets" {
value = ["${aws_s3_bucket.assets.*.bucket}"]
}

output "dynamo_db" {
value = ["${aws_dynamodb_table.dynamodb-terraform-state-lock.*.name}"]
}
