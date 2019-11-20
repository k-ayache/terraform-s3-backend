output "s3_backets" {
  value = "${aws_s3_bucket.assets.*.bucket}"
}

