resource "aws_cloudwatch_log_group" "this" {
  name = "humanizone-api"

  tags = {
    Terraform = "true"
    Environment = "staging"
  }
}