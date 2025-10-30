```yaml
--8<-- "includes/tasks/ansible/user.yml"
```

More secure is using a separate vaulted variables file to keep the credential secure.

```yaml title="playbooks/user.yml"
--8<-- "includes/tasks/ansible/user-vault.yml"
```
```yaml title="playbooks/vars/user.yml"
username: newuser
password: password
```
```sh title="Run playbook providing a password file"
ansible-playbook --vault-password-file vault-pw playbooks/user.yml
```

