resource "aws_cloudwatch_log_group" "main" {
  name = "/logs-${var.cluster_name}/svc-${var.service_name}"
  lifecycle {
    create_before_destroy = true
  }
}