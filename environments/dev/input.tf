variable "env" {
default = "dev"
}

variable "bucket_name" {
#default = ["test3", "test4"]
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

