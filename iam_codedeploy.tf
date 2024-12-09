resource "aws_iam_role" "codedeploy" {
  count = var.deployment_controller == "CODE_DEPLOY" ? 1 : 0

  name = substr(format("codedeploy-${var.service_name}"), 0, 32)

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
      },
    ]
  })
  lifecycle {
    ignore_changes = [
      unique_id,
      arn,
    ]
  }
}

resource "aws_iam_role_policy_attachment" "codedeploy" {
  count      = var.deployment_controller == "CODE_DEPLOY" ? 1 : 0
  role       = aws_iam_role.codedeploy[count.index].name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS"
}
