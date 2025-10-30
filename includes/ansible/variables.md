[**Variables**](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html) can be defined under **vars** (as properties), and they are [referenced](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#referencing-simple-variables) using Jinja2-style double braces: **{{ }}**. 
YAML syntax requires a value starting with double braces to be quoted.

```yaml hl_lines="2-3" title="playbooks/motd.yml"
- hosts: all
  vars:
    name: World
  tasks:
  - command: echo "Hello, {{ name }}!"
```

Variables can also be defined in **variables files**, YAML-format dictionaries conventionally placed in the **vars** directory, and referenced using the **vars\_files** property.
The path for vars files appears to be interpreted relative to the location of the playbook.

```yaml hl_lines="2-3" title="playbooks/motd.yml"
- hosts: all
  vars_files:
  - vars/name.yml
  tasks:
  - copy:
    dest: /etc/motd
    content: Hello, {{ greet_name }}!
```
```yaml title="playbooks/vars/name.yml"
greet_name: World
```

Variables can also be defined at runtime using the [**--extra-vars**/**-e**](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#defining-variables-at-runtime){: #extra-vars} option.
Variables can be passed as space-delimited or JSON format.

```sh
ansible-playbook release.yml -e "version=1.23.45 other_variable=foo"
```

Variables cane be [encrypted inline](https://docs.ansible.com/ansible/2.9/user_guide/playbooks_vault.html#single-encrypted-variable) in an otherwise cleartext vars file.
