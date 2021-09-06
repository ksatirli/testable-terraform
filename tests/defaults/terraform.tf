terraform {
  required_providers {

    # see https://www.terraform.io/docs/language/modules/testing-experiment.html
    test = {
      source = "terraform.io/builtin/test"
      # `version` is omitted as this is a built-in provider
    }
  }

  # specify a minimally required version for Terraform
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "1.0.6"
}
