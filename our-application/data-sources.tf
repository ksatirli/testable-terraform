# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "default" {
  # specify the default VPC
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc#default
  default = true
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group
data "aws_security_group" "default" {
  # specify the VPC Id as a dynamic reference
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group#vpc_id
  vpc_id = data.aws_vpc.default.id

  # specify the name of the default VPC (hint: it is `default`)
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami
data "aws_ami" "amazon_linux_2" {
  # filter on partial name match for AMI
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#filter
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  # only show the most recently published result
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#most_recent
  most_recent = true

  # set the `OwnerId` to the one used by Amazon
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami#owners
  owners = ["137112412989"]
}
