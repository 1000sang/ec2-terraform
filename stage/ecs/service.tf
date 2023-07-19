# resource "aws_ecs_service" "this" {
#   name = "humanizone"
#   cluster = "${aws_ecs_cluster.this.id}"
#   task_definition = "${aws_ecs_task_definition.this.arn}"

#   desired_count = 3

#   load_balancer {
#     target_group_arn = local.target_group_arn
#     container_name = "${aws_ecs_task_definition.this.family}"
#     container_port = 3000
#   }

# #   network_configuration {
# #     subnets = local.public_subnet_ids
# #     assign_public_ip = true
# #     security_groups = ["${aws_security_group.this.id}"] 
# #   }
# }