Ansible host management relies on an [**inventory**](https://docs.ansible.com/ansible/latest/getting_started/get_started_inventory.html#building-an-inventory) file, an INI or YAML format file containing a list of servers or nodes that can be organized in groups.
Inventories are conventionally organized as a file named **hosts** at the root of a project directory, although a system hosts file can also be defined at **/etc/ansible/hosts**.

The group name `all` is implicitly defined, and the following command will display all defined hosts.

```sh title="Display all available hosts"
ansible all --list-hosts
```
