# ECS Service
resource "aws_ecs_service" "service" {
  name                 = var.name
  cluster              = var.cluster_arn
  task_definition      = var.task_definition_arn
  desired_count        = var.desired_count
  launch_type          = var.launch_type
  force_new_deployment = var.force_new_deployment

  network_configuration {
    subnets          = var.network_configuration.subnets
    security_groups  = var.network_configuration.security_groups
    assign_public_ip = var.network_configuration.assign_public_ip
  }
}
