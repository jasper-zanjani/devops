The [**find** module](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/find_module.html) returns a list of files.
When stored in a variable the module's output is a [dictionary variable](https://docs.ansible.com/projects/ansible/latest/playbook_guide/playbooks_variables.html#dictionary-variables) that exposes the list of files at the property **files**: (1)
{: .annotate }

1.  **Examples**

    ```yaml title="ex/clean_waagent_dir.yml" linenums="9" hl_lines="10 15"
    # Finding and then deleting files
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

