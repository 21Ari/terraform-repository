# 6. Firehose Delivery Stream to S3
resource "aws_kinesis_firehose_delivery_stream" "cw_to_s3" {
  name        = "cw-logs-to-s3"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    bucket_arn         = aws_s3_bucket.logs_bucket.arn
    prefix             = "cloudwatch-logs/"
    buffering_size     = 5
    buffering_interval = 300
    compression_format = "GZIP"
  }
}