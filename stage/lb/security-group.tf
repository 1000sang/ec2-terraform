resource "aws_security_group" "this" {

  name   = local.config.security_group_name
  vpc_id = local.vpc_id

  # ingress {
  #   cidr_blocks = ["0.0.0.0/0"]
  #   description = "ingress security_group_rule for passport"
  #   from_port   = "22"
  #   protocol    = "tcp"
  #   self        = "false"
  #   to_port     = "22"
  # }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for https api server"
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for api server"
    from_port   = "3000"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for socket server"
    from_port   = "4000"
    protocol    = "tcp"
    self        = "false"
    to_port     = "4000"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for mongo"
    from_port   = "27017"
    protocol    = "tcp"
    self        = "false"
    to_port     = "27017"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for adminer"
    from_port   = "8080"
    protocol    = "tcp"
    self        = "false"
    to_port     = "8080"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for passport"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = local.config.security_group_name
  }
}