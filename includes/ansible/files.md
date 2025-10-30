```yaml title="Create file"
- copy:
  dest: /etc/motd
  content: "Hello, World!\n" # (1)
```

1. Alma Linux 9 additionally requires the **libselinux-python** package to handle SELinux contexts. It is incorrectly identified as "libselinux-python" in the Ansible error message.

```yaml title="Delete file"
- file:
  path: /etc/motd
  state: absent
```

```yaml title="Create directory"
- file:
  path: /home/ansible/.vim/autoload
  state: directory
  mode: 0755
```
