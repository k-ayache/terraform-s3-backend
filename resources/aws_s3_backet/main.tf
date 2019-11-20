resource "aws_s3_bucket" "assets" {
#  count  = "${var.env == "production" ? 1 : 0}"
  count = length(var.bucket_name)
  bucket = "${var.bucket_name[count.index]}-this-is-test"
}
