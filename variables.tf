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
  default = "ecs"
}

variable "container_image" {
  type = string
  description = "Imagem com tag para deploy da aplicacao no ecs"
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
}

variable "service_cpu" {
  default = 256
}

variable "service_memory" {
  default = 512
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
  default = ["FARGATE","FARGATE_SPOT"]
}

# variable "service_launch_type" {
#   type = string
# }
variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight = number
  }))
  default = [{
  capacity_provider = "SPOT"
  weight = 100
}]
}
variable "service_task_count" {
  default = 3
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