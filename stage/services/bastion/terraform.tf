terraform {
  cloud {
    organization = "humanizone"

    workspaces {
      name = "ec2-bastion"
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

