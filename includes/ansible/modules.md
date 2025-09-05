```yaml title="apt"
--8<-- "includes/ansible/apt/install-swiagent.yml"
```

```yaml title="archive"
--8<-- "includes/ansible/archive.yaml"
```

```yaml title="cli_config"
--8<-- "includes/ansible/cli_config.yaml"
```

```yaml title="command"
--8<-- "includes/ansible/command/capture-motd.yml"

--8<-- "includes/ansible/command/examples.yml"
```

```yaml title="copy"
--8<-- "includes/ansible/copy.yaml"
```

```yaml title="debug"
--8<-- "includes/ansible/debug.yaml"
```

```yaml title="file"
--8<-- "includes/ansible/file.yaml"
```

```sh title="file"
--8<-- "includes/ansible/file.sh"
```

```yaml title="firewalld"
--8<-- "includes/ansible/firewalld.yaml"
```

```yaml title="git"
--8<-- "includes/ansible/git.yaml"
```

```yaml title="group"
--8<-- "includes/ansible/group.yaml"
```

```yaml title="ini_file"
--8<-- "includes/ansible/ini_file.yaml"
```

```yaml title="lineinfile"
--8<-- "includes/ansible/lineinfile.yaml"
```

```yaml title="package"
--8<-- "includes/ansible/package.yaml"
```

```yaml title="redhat_subscription"
--8<-- "includes/ansible/redhat_subscription.yaml"
```

```yaml title="replace"
--8<-- "includes/ansible/replace.yaml"
```

```yaml title="service"
--8<-- "includes/ansible/service.yaml"
```

```sh title="setup"
--8<-- "includes/ansible/setup.sh"
```

```yaml title="shell"
--8<-- "includes/ansible/shell/remove-grub-defaults.yml"
```

```yaml title="snap"
--8<-- "includes/ansible/snap/examples.yaml"
```

```yaml title="systemd"
--8<-- "includes/ansible/systemd/examples.yaml"
```

```yaml title="template"
--8<-- "includes/ansible/template/examples.yaml"
```

1. 
```html title="Jinja2 template file"
<html>
  <h1>This computer is running {{ ansible_os_family }},
  and its hostname is:</h1>
  <h3>{{ ansible_hostname }}</h3>
  {# this is a comment, which won't be copied to the index.html file #}
</html>
```
2. 
```
{% for host in groups['solarwinds'] %}
https://{{ host }}/Orion/AgentManagement/LinuxPackageRepository.ashx?path=/dists/amzn-2015/$basearch
https://{{ host }}:443/Orion/AgentManagement/LinuxPackageRepository.ashx?path=/dists/amzn-2015/$basearch
{% endfor %}
```
3. 
```
{% for host in groups['solarwinds'] %}
deb [trusted=yes] https://{{ host }}/Orion/AgentManagement/LinuxPackageRepository.ashx?path= ubuntu-14 swiagent
deb [trusted=yes] https://{{ host }}:443/Orion/AgentManagement/LinuxPackageRepository.ashx?path= ubuntu-14 swiagent
{% endfor %}
```



```yaml title="user"
--8<-- "includes/ansible/user.yaml"
```

```yaml title="yum"
--8<-- "includes/ansible/yum.yaml"
```

```yaml title="yum_repository"
--8<-- "includes/ansible/yum_repository.yaml"
```

