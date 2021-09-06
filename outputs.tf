# create easily-clickable link for EC2 Console
output "ec2_console_url" {
  description = "URL for EC2 Console"
  value       = "https://${var.aws_region}.console.aws.amazon.com/ec2/v2/home?region=${var.aws_region}#Instances:"
}
