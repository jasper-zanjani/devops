# Verify YAML syntax
ansible-playbook --syntax-check $FILE

# Specify a variable to be used in the playbook
ansible-playbook main.yaml -e $VAR_NAME=$VAR_VALUE
