Various effects are possible using Jinja2 templates:

Jinja2 **control structures** support control flow features like loops and conditionals inside **{% ... %}** blocks.

```yaml hl_lines="3"
- name: Find any YUM/DNF variables
  find:
    paths: "/etc/{% 'dnf' if ansible_distribution_major_version == '8' else 'yum' %}/vars"
  register: _repository_vars_files
```

[Filters](https://jinja.palletsprojects.com/en/latest/templates/#filters) follow a pipe in the template.

```yaml title="Capitalize a value"
line: " {{ hypervisor | upper }}
```

Ansible provides [additional filters](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html#filter-plugins).
Here both the [basename](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/basename_filter.html#ansible-collections-ansible-builtin-basename-filter), [b64decode](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/b64decode_filter.html#ansible-collections-ansible-builtin-b64decode-filter), and [combine](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/combine_filter.html#ansible-collections-ansible-builtin-combine-filter) Ansible filters are used as well as [trim](https://jinja.palletsprojects.com/en/latest/templates/#jinja-filters.trim) which is native to Jinja2.
```yaml hl_lines="2"
- set_fact:
    repository_vars: "{{ (repository_vars | default({})) | combine({ (_file.source | basename): _file.content | b64decode | trim }) }}"
  loop: "{{ _repository_vars_slurped_files.results }}"
  loop_control:
    loop_var: _file
```

