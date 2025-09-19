# 1. S3 bucket for logs
resource "aws_s3_bucket" "logs_bucket" {
  bucket = "my-ec2-logs-bucket-demo-12345" # must be globally unique
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "logs_bucket_versioning" {
  bucket = aws_s3_bucket.logs_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}