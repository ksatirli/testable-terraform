# configuration
MAKEFLAGS      = --no-builtin-rules --silent --warn-undefined-variables
SHELL         := sh

.DEFAULT_GOAL := help
.ONESHELL     :
.SHELLFLAGS   := -eu -c

color_off        = $(shell tput sgr0)
color_bright     = $(shell tput bold)
plan_file_binary = "terraform_plan.tfplan"
plan_file_json   = "terraform_plan.json"
tests_directory  = "./tests"

.PHONY: plan
plan: # Plans resources with Terraform
	terraform \
		plan \
			-out="$(plan_file_binary)"

.PHONY: plan-convert
plan-convert: # Converts a binary Terraform Plan file into JSON
	terraform \
		show \
			-json "$(plan_file_binary)" \
	> "$(plan_file_json)"

.PHONY: apply
apply: # Creates resources with Terraform
	terraform \
		apply \
			"$(plan_file_binary)"

.PHONY: destroy
destroy: # Destroys resources with Terraform
	terraform \
		destroy \

.PHONY: init
init: # Initializes Terraform
	terraform \
		init \
			-upgrade \
			-chdir="$(tests_directory)"

.PHONY: test-plan
test-plan: # Plans Terraform Test resources
	terraform \
		-chdir="$(tests_directory)" \
		plan \
			-out="$(plan_file_binary)"

.PHONY: test-apply
test-apply: # Creates Terraform Test resources
	terraform \
		-chdir="$(tests_directory)" \
		apply \
		"$(plan_file_binary)"

.PHONY: test-destroy
test-destroy: # Destroys Terraform Test resources
	terraform \
		-chdir="$(tests_directory)" \
		destroy

.PHONY: test-init
test-init: # Initializes Terraform Test directory
	terraform \
		-chdir="$(tests_directory)" \
		init \
			-upgrade

.PHONY: lint
lint: # Formats and validates Terraform
	terraform \
		fmt \
			-recursive \
	&& \
	terraform \
		validate

.PHONY: tflint-init
tflint-init: # Initializes tflint
	tflint \
		--init \

.PHONY: tflint
tflint: # Runs tflint
	tflint

.SILENT .PHONY: clear
clear:
	clear

.PHONY: opa-eval
opa-eval: # Runs `opa eval` (specify `policy` like so: `policy=tagging`)
	opa \
		eval \
			--format pretty \
			--data "policies/$(policy).rego" \
			--input "$(plan_file_json)" \
			"data.terraform"

.SILENT .PHONY: help
help: # Displays this help text
	$(info )
	$(info $(color_bright)TESTABLE / TRUSTABLE$(color_off))
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
