# resource "aws_lb_target_group" "this" {
#     name = "humanizone-nest-tg"
#     port = 3000
#     protocol = "HTTP"
#     target_type = "ip"
#     vpc_id = local.vpc_id
# }

/////////////////////

resource "aws_lb_target_group" "this" {
    name = "apitest"
    port = 3000
    protocol = "HTTP"
    vpc_id = local.vpc_id
    target_type = "ip"

    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 10
      matcher = 200
      path = "/"
      port = 3000
      protocol = "HTTP"
      timeout = 3
      unhealthy_threshold = 2
    }
}

# resource "aws_alb_target_group_attachment" "this" {
#     target_group_arn = aws_lb_target_group.this.arn
#     target_id = aws_ecs_service.this.id
#     port = 3000
# }

resource "aws_lb_listener_rule" "apitest" {
    action {
        target_group_arn = aws_lb_target_group.this.arn
        type = "forward"
    }
    condition {
        path_pattern {
            values = ["/apitest*"]
        }
    }
    listener_arn = aws_lb_listener.this.arn
    # priority = "3"
}

resource "aws_lb_listener" "this" {
    load_balancer_arn = local.load_balancer_arn
    port = "${local.config.listner.port}"
    protocol = "${local.config.listner.protocol}"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.this.arn
    }
}

