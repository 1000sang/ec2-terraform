resource "aws_s3_bucket" "this" {
  bucket = "humanizone"

  tags = {
    "Name" = "humanizone"
  }
}