resource "aws_instance" "instance" {
  # specify AMI ID as a dynamic reference
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ami
  ami = data.aws_ami.amazon_linux_2.id

  # specify instance type as a variable reference
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#instance_type
  instance_type = var.ec2_instance_type

  # specify instance tags as a variable reference
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#tags
  tags = var.ec2_instance_tags

  # specify security group as a dynamic reference
  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#vpc_security_group_ids
  vpc_security_group_ids = [
    data.aws_security_group.default.id
  ]
}
