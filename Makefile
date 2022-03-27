# Volume base path based on OS
ifeq ($(OS),Windows_NT)
	DIR_PATH = $(CURDIR)
else
	DIR_PATH = $(PWD)
endif

.PHONY: terra-plan
terra-plan: terra-init terra-get
	terraform -chdir=$(DIR_PATH) plan

.PHONY: terra-destroy
terra-destroy: terra-init terra-get
	terraform -chdir=$(DIR_PATH) destroy -auto-approve

.PHONY: terra-apply
terra-apply: terra-init terra-get
	terraform -chdir=$(DIR_PATH) apply -auto-approve

.PHONY: terra-init
terra-init:
	terraform -chdir=$(DIR_PATH) init

.PHONY: terra-get
terra-get:
	terraform -chdir=$(DIR_PATH) get
