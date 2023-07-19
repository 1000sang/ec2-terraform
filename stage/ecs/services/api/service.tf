resource "aws_ecs_service" "this" {
  name = "${local.config.service.name}"
  cluster = local.ecs_id
  task_definition = "${aws_ecs_task_definition.this.arn}"
  launch_type = "FARGATE"
  desired_count = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name = "${local.config.container.name}"
    container_port = "${local.config.container.port}"
  }

  network_configuration {
    subnets = local.private_subnet_ids
    assign_public_ip = false
    security_groups = ["${aws_security_group.this.id}"] 
  }
}