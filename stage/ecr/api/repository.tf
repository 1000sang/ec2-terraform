resource "aws_ecr_repository" "this" {
  name= "humanizone-api"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Terraform = "true"
    Environment = "staging"
  }
}

resource "aws_ecr_lifecycle_policy" "delete_untagged_all_image" {
  repository = aws_ecr_repository.this.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Delete Untagged All Images",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 1
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}