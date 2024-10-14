resource "aws_iam_role" "service-execution-role" {
  name = "service-role-${var.cluster_name}-${var.service_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
  lifecycle {
    ignore_changes = [name]
  }
}

resource "aws_iam_role_policy" "serivce-execution-role" {
  name = "service-policy-${var.cluster_name}-${var.service_name}"
  role = aws_iam_role.service-execution-role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["elasticloadbalancing:*",
          "ec2:*",
          "ecr:*",
          "logs:*",
          "ssm:GetParameters",
          "secretsmanager:GetSecretValue"
        ]
        Resource = "*"
        Effect   = "Allow"
      },
    ]
  })
  lifecycle {
    ignore_changes = [name]
  }
}