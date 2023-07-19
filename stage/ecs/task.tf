# resource "aws_ecs_task_definition" "this" {
#   family = "humanizone"
#   container_definitions = <<DEFINITION
#   [
#     {
#         "name":"humanizone",
#         "image":"${local.repository_url}",
#         "essential": true,
#         "portMappings": [
#             {
#                 "containerPort": 3000,
#                 "hostPort": 3000
#             }
#         ],
#         "memory": 512,
#         "cpu": 256
#     }
#   ]
#   DEFINITION
# #   requires_compatibilities =  ["ec2"]
#   network_mode = "bridge"
# #   memory = 512
# #   cpu = 256
#   execution_role_arn = "${aws_iam_role.ecsTaskExecutionRole.arn}"
# }