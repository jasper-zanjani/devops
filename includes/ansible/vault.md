**Ansible Vault** is a place to safely keep passwords.
There are two types of vaulted content:

- **Vaulted files**, where the full file, which can contain Ansible variables or other content, is encrypted
- **Single encrypted variables**, where only specific variables within a normal "variable file" are encrypted.

```sh title="Run a playbook providing a vault password file"
ansible-playbook --vault-password-file $pwfile playbooks/motd.yml
```
