SHELL=/usr/bin/env bash

.PHONY: all setup lint roles rstudio

all: lint roles

lint:
	@pip install --quiet --user -r requirements.txt
	@pre-commit install

roles:
	@ansible-galaxy install --ignore-certs -r Ansiblefile.yml

packer:
	ansible-playbook -i "localhost," roles/kostyrev.packer/playbook.yml --diff -c local

rstudio:
	packer build packer-rstudio.json
