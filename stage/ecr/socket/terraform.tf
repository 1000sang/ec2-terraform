terraform {
  cloud {
    organization = "humanizone"

    workspaces {
      name = "ecr-socket"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

