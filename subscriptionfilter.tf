# 8. Subscription filter: CloudWatch Logs → Firehose
resource "aws_cloudwatch_log_subscription_filter" "to_firehose" {
  name            = "cw-to-firehose-sub"
  log_group_name  = aws_cloudwatch_log_group.app_logs.name
  filter_pattern  = "" # empty = all logs
  destination_arn = aws_kinesis_firehose_delivery_stream.cw_to_s3.arn
  role_arn        = aws_iam_role.cw_to_firehose_role.arn
}