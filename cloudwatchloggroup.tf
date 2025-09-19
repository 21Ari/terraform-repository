# 3. CloudWatch Log Group
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/ec2/app/logs"
  retention_in_days = 1
}
