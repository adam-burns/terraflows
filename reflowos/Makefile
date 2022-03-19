PROJECT := reflowos

play:
	ansible-playbook -i hosts.yml install.yml

apply:
	terraform apply -auto-approve

init:
	terraform init

## recreate terraform resources
rebuild: destroy apply

destroy:
	terraform destroy -auto-approve

## create public/private keypair for ssh
create-keypair:
	@echo "THIDIR=$(THISDIR)"
	@echo "Disabled for now"
#	ssh-keygen -t rsa -b 4096 -f id_rsa -C $(PROJECT) -N "" -q

create-demouser:
	ansible-playbook -i hosts.yml reflow_create_demo_user.yml

metadata:
	@echo "Nope, not yet"
#	terraform refresh && terraform output ips
