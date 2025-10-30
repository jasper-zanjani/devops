# Ad-hoc commands
ansible -m shell -a env

# The **command** module is default and does not have to be made explicit
ansible -a env # (1)

# Display all hosts
ansible all --list-hosts

# Display specific groups from a provided inventory
ansible --list-hosts rhel7:rhel8 -i pods/inventory_role/pd/hosts

