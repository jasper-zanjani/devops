The output of an Ansible task can be saved to a variable with the task keyword [`register`](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_variables.html#registering-variables)

```yaml title="command/capture-motd.yml" hl_lines="3"
--8<-- "includes/ansible/command/capture-motd.yml"
```

```yaml title="shell/register-variables.yaml" hl_lines="3 8"
--8<-- "includes/ansible/shell/register-variables.yaml"
```

The value of the register can be used in control flow: (1)
{: .annotate }

1.  **Examples**

    The output of the **find** module can be placed into a register and used with a loop to operate over a list of files:


    ```yaml title="ex/clean_waagent_dir.yml" linenums="9" hl_lines="10 14"
    - name: Find all zip files related to waagent
      find:
        paths: /var/lib/waagent
        file_type: file
        pattern:
          - '*.zip'
        age: 7d
        age_stamp: mtime
      register: waagent_out
    - name: Delete files over 7 days old
      file:
        path: "{{ item.path }}"
        state: absent
      loop: "{{ waagent_out.files }}"
    ```


