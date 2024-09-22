resource "aws_alb_listener_rule" "main" {
  listener_arn = data.aws_ssm_parameter.service-listener.value

  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }

  condition {
    host_header {
      values = var.service_hosts
    }
  }
}