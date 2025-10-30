Ansible **roles** group content in a way that allows it to be shared.
They typically correspond to the service offered (web servers or databases, etc).

Roles have a highly standardized directory structure.

- **defaults**: default values for variables with low perecedence that **can** be overriden by inventory variables
- **files**: static files referenced by role tasks
- **handlers**: handler definitions
- **meta**: metadata about the role, such as author, license, platforms, dependencies, etc
- **tasks**: task definitions
- **vars**: role variables with high precedence that **cannot** be overriden by inventory variables

A skeleton directory can be created with [ansible-galaxy](#ansible-galaxy). 

```sh
ansible-galaxy init $ROLENAME
```

Roles can be called in a playbook under the **roles** property.
The value of the role is interpreted as a path, appended to the project directory or various other potential locations. Because roles are meant to be reused by many playbooks, a central location is recommended:

- ~/.ansible/roles
- /etc/ansible/roles
- /usr/share/ansible/roles


```yaml title="playbooks/motd.yml"
- hosts: all
  roles:
  - role: roles/motd
    vars:
      greet_name: Dgiapusccu # (1)
```

1. Without providing an overriding variable value:
```yaml
- hosts: all
  roles: 
  - roles/motd
```


```yaml title="motd role"
# motd/tasks/main.yml
- copy:
    content: Hello, {{ greet_name }}!
    dest: /etc/motd

# motd/defaults/main.yml
greet_name: World # (1)
```

1. Role variables defined in **vars** have a high precedence and cannot be overriden.
Only values defined in **defaults** can be overriden.

It appears that variables with values defined in the main.yml file located **vars** or **defaults** are automatically picked up.
But if variables are defined in additional files they must be explicitly imported.

```yaml title="motd/tasks/main.yml"
- include_vars:
    file: "{{ role_path }}/defaults/secure.yml"
- copy:
    content: Hello, {{ greet_name }}!
    dest: /etc/motd
```

Normally, tasks in a role execute **before** the other tasks of a playbook. **pre\_tasks** and **post\_tasks** can be defined as well. 


Roles can have dependencies on other dependencies, as defined in the **meta** directory.

```yaml
dependencies:
- { role: apache, port: 80 }
- { role: mariadb, dbname: addresses, admin_user: bob }
```

