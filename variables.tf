# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#region
variable "aws_region" {
  type        = string
  description = "This is the AWS region."

  # specify the Stockholm, SE region
  default = "eu-north-1"
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#default_tags
variable "aws_default_tags" {
  type        = map(string)
  description = "Tags to apply across all resources."

  default = {
    Environment = "testcon-europe-2021"
    Owner       = "kerim@hashicorp.com"
  }
}
