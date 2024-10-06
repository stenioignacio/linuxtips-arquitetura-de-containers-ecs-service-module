resource "aws_security_group" "main" {
  name = var.service_name

  vpc_id = data.aws_ssm_parameter.vpc-id.value


  ingress {
    from_port = var.service_port
    to_port   = var.service_port
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  lifecycle {
    ignore_changes = [name]
  }
}