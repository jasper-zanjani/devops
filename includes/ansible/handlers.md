**Handlers** are tasks that are executed when notified by a task. They are only run once, and only if the notifying task has made a change to the system. 

Here, **Enable Apache** will be called if **Install Apache** makes a change. 
If apache2 is already installed, the handler is not called. 

```yaml
- hosts: webservers
  become: yes
  tasks:
  - name: Install Apache
    apt: name=apache2 update_cache=yes state=latest
    notify: enable apaches

  handlers:
  - name: Enable Apache
    service: name=apache2 enabled=yes state=started
```


```yaml
- hosts: all
  vars:
    package_name: apache2
  tasks:
  - name: this installs a package
    apt: "name={{ package_name }} update_cache=yes state=latest"
    notify: enable apache
  handlers:
  - name: enable apache
    service: "name={{ package_name }} enabled=yes state=started" 
```

