# load our application code as a module
# see https:#www.terraform.io/docs/language/modules/syntax.html#calling-a-child-module
module "our_application" {
  count = 1

  source = "./our-application"

  # specify module variables
  ec2_instance_tags = {
    Name = "TestCon Workshop"
  }

  ec2_instance_type = "t3.micro"
}
