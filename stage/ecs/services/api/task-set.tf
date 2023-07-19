# resource "aws_ecs_task_set" "this" {
#   service         = aws_ecs_service.this.id
#   cluster         = local.ecs_id
#   task_definition = aws_ecs_task_definition.this.arn

#   load_balancer {
#     target_group_arn = aws_lb_target_group.this.arn
#     container_name   = "humanizone-nest"
#     container_port   = 3000
#   }
# }