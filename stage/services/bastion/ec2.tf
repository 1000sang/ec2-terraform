module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = local.config.instance_name

  ami                    = local.config.ami
  instance_type          = "t3.micro"
  key_name               = local.config.key_name
  # monitoring             = true
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = local.public_subnet_ids[0]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}