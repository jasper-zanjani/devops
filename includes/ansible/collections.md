Ansible [**collections**](https://www.youtube.com/watch?v=WOcqhk7TdYc) comprise a standardized format for **Ansible content** distribution, allowing it to be delivered asynchronously and on-demand separately from Ansible Automation Platform releases.
Ansible content can include playbooks, modules, roles, documentation, tests, plugins.
Ansible collections are delivered using **Ansible Galaxy** and each collection needs a galaxy.yml file that describes the collection.

Collections can be installed from a YAML-format requirements file:

```sh
ansible-galaxy collection install -r ansible/requirements.yml
```

```yaml title="ansible/requirements.yml"
roles:
- src: git@ssh.dev.azure.com:v3/PODS-LLC/SWE/devops_inventory_role
  version: master # (2)
  scm: git
  name: inventory # (1)
```

1. This apparently determines how the directory is renamed.
2. Branch name

