output "ami_id" {
  description = "EC2 Image Id"
  value       = module.our_application[0].ami_id
}

# create easily-clickable link for EC2 Console
output "ec2_console_url" {
  description = "URL for EC2 Console"
  value       = "https://${var.aws_region}.console.aws.amazon.com/ec2/v2/home?region=${var.aws_region}#Instances:"
}

output "ec2_ids" {
  description = "EC2 Instance Ids"
  value       = module.our_application[*].instance_ids
}

output "ec2_tags" {
  description = "EC2 Instance Ids"
  value       = module.our_application[*].instance_tags
}

output "vpc_id" {
  description = "Default VPC Id"
  value       = module.our_application[0].vpc_id
}

output "sg_id" {
  description = "Security Group Id"
  value       = module.our_application[0].sg_id
}
