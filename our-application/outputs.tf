output "ami_id" {
  description = "ARN for Amazon Linux 2 AMI"
  value       = data.aws_ami.amazon_linux_2.arn
}

output "vpc_id" {
  description = "VPC Id"
  value = data.aws_vpc.default.id
}

output "sg_id" {
  description = "Security Group Id"
  value = data.aws_security_group.default.id
}
