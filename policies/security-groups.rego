package terraform.aws_security_group

import data.terraform.util.changes_by_type
import data.terraform.util.is_create_or_update

resource_type := "aws_security_group"

# check security groups for inline `ingress` rules
deny[msg] {
  changeset := changes_by_type[resource_type][_]

  changeset.change.after.ingress
  msg := sprintf("`ingress` rule found in resource `%v`. Change this to a Security Group Rule", [changeset.address])
}

# check security groups for inline `egress` rules
deny[msg] {
  changeset := changes_by_type[resource_type][_]

  changeset.change.after.egress
  msg := sprintf("`egress` rule found in resource `%v`. Change this to a Security Group Rule", [changeset.address])
}
