config {
  # modules should be their own repository and should be tested separately
  module = false
  force  = false
}

# specify the `aws` plugin
# see https://github.com/terraform-linters/tflint-ruleset-aws#installation
plugin "aws" {
  enabled = true
  version = "0.7.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"

  # disable deep-checking to allow for running inside GitHub Actions
  # see https://github.com/terraform-linters/tflint-ruleset-aws/blob/master/docs/deep_checking.md
  deep_check = false

  # set AWS region to operate in
  # see https://github.com/terraform-linters/tflint-ruleset-aws/blob/master/docs/configuration.md#region
  region     = "eu-north-1"
}


rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
}
