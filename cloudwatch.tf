resource "aws_cloudwatch_log_group" "cloudwatch-log-group" {
  name              = "ecs/${var.projectName}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "cloudwatch-log-stream" {
  name           = "ecs"
  log_group_name = aws_cloudwatch_log_group.cloudwatch-log-group.name
}