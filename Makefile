.EXPORT_ALL_VARIABLES:
.ONESHELL:
.SHELL := /bin/bash
ENV ?= "dev"
REGION ?= "eu-central-1"
VARS="params/$(REGION)/$(ENV)/params.tfvars"
REPO="iac"
# Dynamically set up the terraform backend
# into a S3 bucket
.PHONE: prep
prep:
	@terraform init \
		-backend=true \
		-backend-config="region=${REGION}" \
		-backend-config="key=${REPO}" \
		-backend-config="bucket=${REPO}-${REGION}-${ENV}"

# run make plan and pass on some dynamic variables
# and source the rest of variables from config $VARS file
.PHONY: plan
plan: prep ## Show what terraform thinks it will do
	@terraform plan \
		-detailed-exitcode \
		-out=plan.out \
		-lock=true \
		-input=false \
		-refresh=true \
		-var="env=$(ENV)" \
		-var="region=$(REGION)" \
		-var-file="$(VARS)"; \
		EXIT_CODE=$$?; \
		echo "Plan exited with status $$EXIT_CODE"; \
		echo $$EXIT_CODE > status

.PHONY: apply destroy
