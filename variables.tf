# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs#region
variable "aws_region" {
  type        = string
  description = "This is the AWS region."

  # specify the Stockholm, SE region
  default = "eu-north-1"
}
