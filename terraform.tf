terraform {
  # specify a backend to store Terraform State in
  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  backend "remote" {
    organization = "ksatirli"

    workspaces {
      name = "testcon-europe-2021"
    }
  }

  # specify a minimally required version for Terraform
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.0.6"

  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/3.57.0/docs
    aws = {
      source  = "hashicorp/aws"
      version = "3.57.0"
    }
  }
}

provider "aws" {
  # specify default tags that will be applied to ALL resources
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
  default_tags {
    tags = {
      Environment = "testcon-europe-2021"
      Owner       = "kerim@hashicorp.com"
    }
  }

  region = var.aws_region
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#region
variable "aws_region" {
  type        = string
  description = "This is the AWS region."

  # specify the Stockholm, SE region
  default = "eu-north-1"
}
