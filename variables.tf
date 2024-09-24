variable "project_name" {
  default = "arquitetura-de-containers-aws"
}
variable "region" {
  type = string
}
variable "project_region" {
  default = "us-east-1"
}

variable "service_name" {

}

variable "cluster_name" {

}

variable "vpc_id" {

}

variable "ssm_vpc_id" {
  default = "/vpc/vpc-id-arquitetura-de-containers-aws"
}

variable "private_subnets" {
  type = list(string)
}

variable "service_port" {
  type    = number
  default = 8080
}

variable "service_cpu" {

}

variable "service_memory" {

}

variable "service_listener" {

}

variable "service_task_execution_role" {

}

variable "service_healthcheck" {
  type = map(any)
}

variable "service_hosts" {
  default = [
    "chip.linuxtips.demo"
  ]
}

variable "enviroment_variables" {
  type = list(map(string))
  default = [
    {
      name  = "FOO",
      value = "BAR"
    },
    {
      name  = "PING",
      value = "PONG"
    }
  ]
}

variable "capabilities" {
  type    = list(string)
  default = ["FARGATE"]
}

variable "serivce_launch_type" {

}
variable "service_task_count" {

}

#Autoscaling
variable "scale_type" {
  default = null
}

variable "task_minimum" {
  default = 1
}

variable "task_maximum" {
  default = 10
}

# Autoscaling de cpu

variable "scale_out_cpu_threshold" {
  default = 80
}

variable "scale_out_adjustment" {
  default = 1
}

variable "scale_out_comparison_operator" {
  default = "GreaterThanThreshold"
}

variable "scale_out_statistic" {
  default = "Average"
}

variable "scale_out_period" {
default = 60
}

variable "scale_out_evaluation_periods" {
default = 2
}

variable "scale_out_cooldown" {
  default = 60
}

variable "scale_in_cpu_threshold" {
  default = 30
}

variable "scale_in_adjustment" {
  default = -1
}

variable "scale_in_comparison_operator" {
  default = "LessThanOrEqualTothreshold"
}

variable "scale_in_statistic" {
  default = "Average"
}

variable "scale_in_period" {
  default = 120
}

variable "scale_in_evaluation_periods" {
  default = 3
}

variable "scale_in_cooldown" {
  default = 120
}

#Tracking CPU
variable "scale_tracking_cpu" {
  default = 80
}
#Tracking Requests
variable "alb_arn" {
  default = null
}
variable "scale_tracking_requests" {
  default = 0
}