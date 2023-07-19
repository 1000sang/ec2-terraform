data "aws_acm_certificate" "humanizone_co_kr" {
  domain = "*.humanizone.co.kr"
  statuses = ["ISSUED"]
}

/////////////

resource "aws_alb_listener" "https" {
  load_balancer_arn = local.load_balancer_arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = data.aws_acm_certificate.humanizone_co_kr.arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }
}

# resource "aws_lb_target_group" "https" {
#     name = "humanizone-https-tg"
#     port = 3000
#     protocol = "HTTP"
#     vpc_id = local.vpc_id

#     health_check {
#       enabled = true
#       healthy_threshold = 3
#       interval = 10
#       matcher = 200
#       path = "/"
#       port = 3000
#       protocol = "HTTP"
#       timeout = 3
#       unhealthy_threshold = 2
#     }
# }

resource "aws_lb_target_group_attachment" "https" {
    target_group_arn = aws_lb_target_group.api.arn
    target_id = module.ec2_instance.id
    port = 3000
}

/////////////

resource "aws_lb_target_group" "api" {
    name = "humanizone-ec2-tg"
    port = 3000
    protocol = "HTTP"
    vpc_id = local.vpc_id
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

# resource "aws_lb_target_group_attachment" "api" {
#     target_group_arn = aws_lb_target_group.api.arn
#     target_id = module.ec2_instance.id
#     port = 3000
# }

# resource "aws_lb_listener" "api" {
#     load_balancer_arn = local.load_balancer_arn
#     port = "3000"
#     protocol = "HTTP"

#     default_action {
#       type = "forward"
#       target_group_arn = aws_lb_target_group.api.arn
#     }
# }



/////////////

resource "aws_lb_target_group" "socket" {
    name = "humanizone-socket-tg"
    port = 4000
    protocol = "HTTP"
    vpc_id = local.vpc_id
    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 10
      matcher = 200
      path = "/"
      port = 4000
      protocol = "HTTP"
      timeout = 3
      unhealthy_threshold = 2
    }
}

resource "aws_lb_target_group_attachment" "socket" {
    target_group_arn = aws_lb_target_group.socket.arn
    target_id = module.ec2_instance.id
    port = 4000
}

resource "aws_lb_listener" "socket" {
    load_balancer_arn = local.load_balancer_arn
    port = "4000"
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-2016-08"
    certificate_arn = data.aws_acm_certificate.humanizone_co_kr.arn

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.socket.arn
    }
}

/////////////

resource "aws_lb_target_group" "mongo" {
    name = "humanizone-mongo-tg"
    port = 27017
    protocol = "HTTP"
    vpc_id = local.vpc_id
    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 10
      matcher = 200
      path = "/"
      port = 27017
      protocol = "HTTP"
      timeout = 3
      unhealthy_threshold = 2
    }
}

resource "aws_lb_target_group_attachment" "mongo" {
    target_group_arn = aws_lb_target_group.mongo.arn
    target_id = module.ec2_instance.id
    port = 27017
}

resource "aws_lb_listener" "mongo" {
    load_balancer_arn = local.load_balancer_arn
    port = "27017"
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-2016-08"
    certificate_arn = data.aws_acm_certificate.humanizone_co_kr.arn

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.mongo.arn
    }
}

/////////////

resource "aws_lb_target_group" "adminer" {
    name = "humanizone-adminer-tg"
    port = 8080
    protocol = "HTTP"
    vpc_id = local.vpc_id
    health_check {
      enabled = true
      healthy_threshold = 3
      interval = 10
      matcher = 200
      path = "/"
      port = 8080
      protocol = "HTTP"
      timeout = 3
      unhealthy_threshold = 2
    }
}

resource "aws_lb_target_group_attachment" "adminer" {
    target_group_arn = aws_lb_target_group.adminer.arn
    target_id = module.ec2_instance.id
    port = 8080
}

resource "aws_lb_listener" "adminer" {
    load_balancer_arn = local.load_balancer_arn
    port = "8080"
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-2016-08"
    certificate_arn = data.aws_acm_certificate.humanizone_co_kr.arn

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.adminer.arn
    }
}