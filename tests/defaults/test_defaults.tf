# load main codebase as module
module "test_target" {
  source = "../.."
}

resource "test_assertions" "ec2_console_url" {
  component = "ec2_console_url"

  check "output" {
    description = "output \"ec2_console_url\" value"
    condition   = can(regex("eu-north-1", module.test_target.ec2_console_url))
  }
}

resource "test_assertions" "ec2_tags" {
  component = "ec2_tags"

  check "output" {
    description = "output \"ec2_tags\" value"
    condition   = can(regex("eu-north-1", module.test_target.ec2_ids[0]))
  }
}
