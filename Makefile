# configuration
MAKEFLAGS      = --no-builtin-rules --silent --warn-undefined-variables
SHELL         := sh

.DEFAULT_GOAL := help
.ONESHELL     :
.SHELLFLAGS   := -eu -c

color_off    = $(shell tput sgr0)
color_bright = $(shell tput bold)
plan_file    = "plan.tfplan"

# configuration for Terraform-specific variables
ifdef auto-approve
terraform_auto_approve = -auto-approve
else
terraform_auto_approve =
endif

.PHONY: plan
plan: # Plans prerequisite resources with Terraform
	terraform \
		plan \
			-out="$(plan_file)"

.PHONY: apply
apply: # Creates prerequisite resources with Terraform
	terraform \
		apply \
			$(terraform_auto_approve) \
			"$(plan_file)"

.PHONY: destroy
destroy: # Destroys prerequisite resources with Terraform
	terraform \
		destroy \
			$(terraform_auto_approve)

.PHONY: init
init: # Initializes Terraform
	terraform \
		init \
			-upgrade

.PHONY: lint
lint: # Formats and validates Terraform
	terraform \
		fmt \
			-recursive
	&& \
	terraform \
		validate

.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: # Displays this help text
	$(info )
	$(info $(color_bright)PACKER TEMPLATES$(color_off))
	grep \
		--context=0 \
		--devices=skip \
		--extended-regexp \
		--no-filename \
			"(^[a-z-]+):{1} ?(?:[a-z-])* #" $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?# "}; {printf "\033[1m%s\033[0m;%s\n", $$1, $$2}' | \
	column \
		-c2 \
		-s ";" \
		-t
	$(info )
