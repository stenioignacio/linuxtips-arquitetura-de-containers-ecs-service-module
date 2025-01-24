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

variable "container_image" {
  type        = string
  description = "Imagem com tag para deploy da aplicacao no ecs"
}

variable "cluster_name" {
  default = "ecs-cluster-arquitetura-de-containers-aws"
}

variable "vpc_id" {

}

variable "ssm_vpc_id" {
  default = "/linuxtips-vpc/vpc/vpc-id"
}

variable "private_subnets" {
  type = list(string)
}

variable "service_port" {
  type = number
}

variable "use_lb" {
  type        = bool
  default     = true
  description = "Habilita a exposição do serviço via load balancer"
}

variable "service_protocol" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "use_service_connect" {
  type    = bool
  default = false
}

variable "service_connect_name" {
  type    = string
  default = null
}

variable "service_connect_arn" {
  type    = string
  default = null
}

variable "service_cpu" {
  default = 256
}

variable "service_memory" {
  default = 512
}

variable "service_listener" {
  type    = string
  default = "/linuxtips/ecs/lb/internal/listerner"
}

variable "service_task_execution_role" {
  type        = string
  default     = null
  description = "ARN da role de execução de tarefas do ECS que o serviço usará para executar"
}

variable "service_healthcheck" {
  type = map(any)
}

variable "deployment_controller" {
  type = string
}

variable "codedeploy_strategy" {
  type    = string
  default = "CodeDeployDefault.ECSAllAtOnce"
}

variable "codedeploy_deployment_option" {
  type    = string
  default = "WITH_TRAFFIC_CONTROL"
}

variable "codedeploy_deployment_type" {
  type    = string
  default = "BLUE_GREEN"
}

variable "codedeploy_termination_wait_time_in_minutes" {
  type    = number
  default = 2
}

variable "codedeploy_rollback_alarm" {
  type    = bool
  default = true
}

variable "codedeploy_rollback_error_threshold" {
  type    = number
  default = 10
}

variable "codedeploy_rollback_error_period" {
  type    = number
  default = 60
}

variable "codedeploy_rollback_error_evaluation_period" {
  type    = number
  default = 1
}

variable "service_hosts" {
  default = [
    "chip.linuxtips.demo"
  ]
}

variable "environment_variables" {
  type = list(object({
    name : string
    value : string
  }))
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

variable "secrets" {
  type = list(object({
    name : string
    valueFrom : string
  }))
  default     = []
  description = "Lista de secrets manager ou do parameter store"
}

variable "capabilities" {
  type = list(string)
  # default = ["FARGATE", "FARGATE_SPOT"]
  default = ["FARGATE"]
}

# variable "service_launch_type" {
#   type = string
# }
variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
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
variable "ssm_alb_arn" {
  default = "/linuxtips/ecs/lb/internal/id"
}

variable "ssm_alb_internal" {
  default = "/linuxtips/ecs/lb/internal/id"
}
variable "ssm_listener_internal" {
  default = "/linuxtips/ecs/lb/internal/listerner"
}
variable "scale_tracking_requests" {
  default = 0
}

variable "efs_volumes" {
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    read_only : bool
  }))
  default     = []
  description = "Volukmes EFS existentes para serem montados nas tasks do ECS"
}

variable "service_discovery_namespace" {
  description = "Namespace ID do Service Discovery"
  default     = null
}
