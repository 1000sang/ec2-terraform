resource "aws_security_group" "this" {

  name   = "ecs_api_server_sg"
  vpc_id = local.vpc_id

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   description = "ingress security_group_rule for ecs_nest"
  #   from_port   = "22"
  #   protocol    = "tcp"
  #   self        = "false"
  #   to_port     = "22"
  # }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for humanizone api server"
    from_port   = "3001"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3001"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for humanizone api server"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "humanizone_api_server_sg"
  }
}