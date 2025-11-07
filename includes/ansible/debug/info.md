The [**debug**](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/debug_module.html#ansible-collections-ansible-builtin-debug-module) module is used to output information to the output of the control node. (1)
{: .annotate }

1.  **Examples**

    ```yaml title="ex/clean/waagent_dir.yml" hl_lines="3 7" linenums="164"
    - name: Daniel wanted more details 
      shell: "du -shx /var/*" #"du -h --max-depth=2"
      register: allspace
      ignore_errors: true

    - debug:
        var: allspace.stdout_lines   
    ```

    ```yaml title="ex/yum_check_update.yml" linenums="15" hl_lines="5 10"
    - name: yum check | Check for updates
      yum:
        list: updates
        update_cache: true
      register: stat_yum_check_output
      when: (ansible_os_family == "RedHat") or (ansible_os_family == "CentOS")

    - name: yum check | Output debug yum check
      debug:
        msg: "{{ stat_yum_check_output }}"
      when: (ansible_os_family == "RedHat") or (ansible_os_family == "CentOS")
    ```

```yaml
--8<-- "includes/ansible/debug.yaml"
```

