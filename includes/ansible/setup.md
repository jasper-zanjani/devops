The Ansible **control node** needs to be configured to elevate privileges (a setting referred to as "become"). (1)
{: .annotate }

1.  Privilege escalation can be specified by modifying **ansible.cfg** in the relevant project directory or the system config at **/etc/ansible/ansible.cfg**

    ```ini title="ansible.cfg"
    [privilege_escalation]
    become=yes
    ```

    Alternatively, the ansible-playbook command can be run with `--become`.

An Ansible service account is created on each **managed node**.

```sh
useradd ansible -s /usr/bin/bash -mG wheel
passwd ansible
su - ansible
ssh-keygen -A
```

Now the service account is given the ability to sudo any command without a password.

```sh title="/etc/sudoers.d/ansible"
# Without this line, plays will fail with the message "Missing sudo password" 
ansible ALL=(ALL) NOPASSWD: ALL
```

