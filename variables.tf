variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}

variable "AWS_SESSION_TOKEN" {
  type    = string
  default = null
}

variable "AWS_REGION" {
  type = string
}

variable "name" {
  type        = string
  description = "(Required) Name of the service (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "cluster_arn" {
  type        = string
  description = "(Optional) ARN of an ECS cluster."
}

variable "task_definition_arn" {
  type        = string
  description = "(Optional) Family and revision (family:revision) or full ARN of the task definition that you want to run in your service. Required unless using the EXTERNAL deployment controller. If a revision is not specified, the latest ACTIVE revision is used."
}

variable "desired_count" {
  type        = number
  description = "(Optional) Number of instances of the task definition to place and keep running. Defaults to 0. Do not specify if using the DAEMON scheduling strategy."
}

variable "launch_type" {
  type        = string
  description = "(Optional) Launch type on which to run your service. The valid values are EC2, FARGATE, and EXTERNAL. Defaults to EC2."
  default     = "FARGATE"
}

variable "force_new_deployment" {
  type        = bool
  description = "(Optional) Enable to force a new task deployment of the service. This can be used to update tasks to use a newer Docker image with same image/tag combination (e.g., myimage:latest), roll Fargate tasks onto a newer platform version, or immediately deploy ordered_placement_strategy and placement_constraints updates."
  default     = true
}

variable "network_configuration" {
  type = object({
    subnets          = list(string)
    security_groups  = optional(list(string))
    assign_public_ip = optional(bool)
  })
  description = "(Optional) Network configuration for the service. This parameter is required for task definitions that use the awsvpc network mode to receive their own Elastic Network Interface, and it is not supported for other network modes."
}
