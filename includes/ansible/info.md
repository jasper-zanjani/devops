**Ansible** (1) is an automation tool used for configuration management using human-readable YAML templates. 
Ansible is distinguished for being **agentless**, meaning no special software is required on the nodes it manages.
{: .annotate }

1.  

    --8<-- "includes/ansible/callout.md"

Ansible environments are usually made of [three components](https://docs.ansible.com/ansible/latest/getting_started/index.html):

-   Control node

-   Inventory (1)
    {: .annotate }

    1.  

        --8<-- "includes/ansible/inventory.md"

-   Managed nodes

Ansible can be used in one of two ways:

-   Running ad hoc commands, executed in realtime by an administrator working at the terminal using the [ansible command](../commands.md#ansible)

-   Running playbooks, YAML documents that represent a sequence of tasks, scripted actions which apply changes uniformly over a set of hosts, using the [ansible-playbook command](../commands.md#ansible-playbook) command. 

Any ad hoc command can be rewritten as a playbook, but some modules can only be used effectively as playbooks.

```yaml title="playbooks/motd.yml"
- hosts: all
  tasks:
  - copy:
    dest: /etc/motd
    content: "Hello, World!"
```

#### Variables

--8<-- "includes/ansible/variables.md"

#### Control flow

--8<-- "includes/ansible/flow.md"

#### Jinja2

--8<-- "includes/ansible/jinja2.md"



