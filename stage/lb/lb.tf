resource "aws_lb" "this" {
  name = local.config.name
  internal = local.config.internal
  load_balancer_type = local.config.load_balancer_type
  security_groups = [aws_security_group.this.id]
  subnets = local.public_subnet_ids

  enable_deletion_protection = local.config.enable_deletion_protection
#   access_logs {
#     bucket = local.bucket
#     prefix = "lb_logs"
#     enabled = true
#   }

  tags = {
    Environment = "staging"
  }
}