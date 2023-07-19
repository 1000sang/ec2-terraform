module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = local.config.instance_name

  ami                    = local.config.ami
  instance_type          = "t3.medium"
  key_name               = local.config.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.this.id]
  subnet_id              = local.private_subnet_ids[0]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}

# resource "aws_ebs_volume" "this" {
#   availability_zone = local.private_subnet_azs[0]
#   size = 10
#   encrypted = true

#   tags = {
#     Terraform   = "true"
#     Environment = "staging"
#     Name = "humanizone"
#   }
# }

# resource "aws_volume_attachment" "this" {
#   device_name = "/dev/sdh"
#   volume_id = aws_ebs_volume.this.id
#   instance_id = module.ec2_instance.id
# }