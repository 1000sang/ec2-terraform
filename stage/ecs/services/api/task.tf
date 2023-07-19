resource "aws_ecs_task_definition" "this" {
  family = local.config.task.family
  requires_compatibilities =  ["FARGATE"]
  network_mode = "awsvpc"
  memory = local.config.task.memory
  cpu = local.config.task.cpu
  execution_role_arn = local.role_arn
  container_definitions = jsonencode([
    {
        "name": "${local.config.container.name}"
        "image": "${local.repository_url}:latest"
        "essential": true
        "memory": "${local.config.task.memory}"
        "cpu": "${local.config.task.cpu}"
        "portMappings": [
            {
                "containerPort": 3000,
                "hostPort": 3000
            }
        ]
        "logConfiguration": {
          logDriver = "awslogs",
          options = {
            awslogs-group         = "${aws_cloudwatch_log_group.this.name}"
            awslogs-region        = "ap-northeast-2",
            awslogs-stream-prefix = "ecs"
          }
        }
    }
  ])

  tags = {
    Terraform = "true"
    Environment = "staging"
  }
}