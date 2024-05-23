current_dir := $(shell pwd)
tags ?= all

setup:
	ansible-playbook playbook.yml -i  hosts.yml --extra-vars "secrets_path=${current_dir}/secrets current_dir=${current_dir}" --tags="${tags}"

setup-ssh:
	ansible-playbook playbook.yml -i  hosts.yml --extra-vars secrets_path=${current_dir}/secrets --tags="ssh"

setup-nvim:
	ansible-playbook playbook.yml -i  hosts.yml --extra-vars current_dir=${current_dir} --tags="nvim"

