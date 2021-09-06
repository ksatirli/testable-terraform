//resource "aws_instance" "testcon" {
//  # specify AMI ID as a dynamic reference
//  # see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ami
//  ami = data.aws_ami.amazon_linux_2.id
//
//  # specify instance type as a variable reference
//  instance_type = var.ec2_instance_type
//
//  # specify security group as a dynamic reference
//  security_groups = [
//    data.aws_security_group.default.id
//  ]
//
//  # specify instance tags as a variable reference
//  tags = var.ec2_instance_tags
//}
