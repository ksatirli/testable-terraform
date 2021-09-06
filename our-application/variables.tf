# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#tags
variable "ec2_instance_tags" {
  type        = map(any)
  description = "A map of tags to assign to the resource."

  # the default for this value is specified in the `module` block in `../main.tf`

  validation {
    condition     = length(var.ec2_instance_tags) > 0
    error_message = "Invalid Tag Reference, must contain at least one tag."
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#instance_type
variable "ec2_instance_type" {
  type        = string
  description = "The instance type to use for the instance."

  # the default for this value is specified in the `module` block in `../main.tf`

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.ec2_instance_type)
    error_message = "Invalid Instance Type, must be one of `t3.micro`, `t3.small`, or `t3.medium`."
  }
}
