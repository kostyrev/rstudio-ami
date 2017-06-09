SHELL=/usr/bin/env bash

.PHONY: all setup lint roles rstudio

all: lint roles

lint:
	@pip install --quiet --user -r requirements.txt
	@pre-commit install

roles:
	@ansible-galaxy install --ignore-certs -r Ansiblefile.yml

rstudio:
	packer build packer-rstudio.json
