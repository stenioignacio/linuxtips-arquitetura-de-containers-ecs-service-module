resource "aws_cloudwatch_log_group" "main" {
  name = "/logs-${var.cluster_name}-${var.service_name}"
  lifecycle {
    ignore_changes = [name]
  }
}