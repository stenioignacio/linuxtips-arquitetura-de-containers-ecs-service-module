resource "aws_alb_listener_rule" "main" {
  listener_arn = data.aws_ssm_parameter.service-listener.value

  count = (var.use_lb && var.deployment_controller == "ECS") ? 1 : 0
  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main[count.index].arn
  }

  condition {
    host_header {
      values = var.service_hosts
    }
  }
}
