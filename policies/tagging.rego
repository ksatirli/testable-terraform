package terraform.common

allowed_values_environment := [
  "testcon-europe-2020"
]

# alert on missing tag(s)
deny[msg] {
    changeset := input.resource_changes[_]

    # require the following tags to be present
    # note that the default tags of this repository set "Owner" not "Team"
    required_tags := {"Environment", "Team"}

    # fetch actual (provided) tags
    provided_tags := {tag | changeset.change.after.tags_all[tag]}

    # "calculate" diff between required and provided tags
    missing_tags := required_tags - provided_tags
    count(missing_tags) > 0

    # print message
    msg := sprintf("Missing tag `%v` for resource `%v`", [
        concat(", ", missing_tags),
        changeset.address
    ])
}


# alert on invalid `environment` tag
deny[msg] {
  changeset := input.resource_changes[_]

  not validate_tags(changeset.change.after.tags.environment, allowed_values_environment)
  msg := sprintf("Invalid environment `%v` for resource `%v`", [
    changeset.address,
    changeset.change.after.tags.environment,
  ])
}

# function to parse tags
validate_tags(tag, values) {
  tag == values[_]
}
