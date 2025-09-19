# 7. IAM role for CloudWatch Logs to put data into Firehose
resource "aws_iam_role" "cw_to_firehose_role" {
  name = "cw-to-firehose-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = { Service = "logs.ap-south-1.amazonaws.com" },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "cw_to_firehose_policy" {
  role = aws_iam_role.cw_to_firehose_role.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["firehose:PutRecord", "firehose:PutRecordBatch"],
        Resource = aws_kinesis_firehose_delivery_stream.cw_to_s3.arn
      }
    ]
  })
}