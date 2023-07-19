resource "aws_s3_bucket_policy" "this" {
     bucket = aws_s3_bucket.this.id
   policy = <<EOT
     {
         "Version": "2012-10-17",
        "Statement": [
           {
               "Action": "s3:GetBucketAcl",
               "Effect": "Allow",
               "Resource": "${aws_s3_bucket.this.arn}",
               "Principal": "*"
           },
           {
               "Action": "s3:PutObject" ,
               "Effect": "Allow",
               "Resource": "${aws_s3_bucket.this.arn}/*",
               "Condition": { "StringEquals": { "s3:x-amz-acl": "bucket-owner-full-control" } },
               "Principal": "*"
            },
            {
               "Action": "s3:GetObject" ,
               "Effect": "Allow",
               "Resource": "${aws_s3_bucket.this.arn}/*",
               "Condition": { "StringEquals": { "s3:x-amz-acl": "bucket-owner-full-control" } },
               "Principal": "*"
            }
         ]
     }
 EOT
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "this" {
  depends_on = [
    aws_s3_bucket_ownership_controls.this,
    aws_s3_bucket_public_access_block.this,
  ]
  bucket = aws_s3_bucket.this.id

  acl = "public-read"
}