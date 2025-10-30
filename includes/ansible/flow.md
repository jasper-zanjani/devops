Conditional logic is [implemented](https://www.linuxjournal.com/content/ansible-part-iii-playbooks) on each task by defining a value for the **when** statement:

```yaml hl_lines="7"
- hosts: all
  vars:
    startme: true
  tasks:
  - command: echo Hello, World!
    when: startme
```

Here is an unusual example of a **loop** that uses the control variable to successively delete, then create a directory

```yaml
- name: Regen Kickstart dir
  file:
    path: "{{ isopath }}/ks"
    state: "{{ stmp }}"
  loop:
    - absent
    - directory
  loop_control:
    loop_var: stmp
```
