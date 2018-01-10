
sample call

ansible-playbook -i inventories/{{ENV}}  main_vms.yaml --extra-vars "application_package=/opt/ansible-packages/server_validation_package/server_validation_package.tar.gz hosts={{ENV}}"

ENV
dev
qa
stg
prod
