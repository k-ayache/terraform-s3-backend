variable "env" {
default = "dev"
}

variable "bucket_name" {
  type = string
}


variable "region" {
default = "us-west-2"
}

variable "version_aws" {
default = ">= 2.38"
}

variable "version_terraform" {
default = ">= 0.12"
}

