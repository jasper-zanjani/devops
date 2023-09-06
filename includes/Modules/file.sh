# Create a symlink
ansible $CLIENT -b -m file -a "src=/etc/ntp.conf dest=/home/user/ntp.conf owner=user group=user state=link"

# Create a folder using an ad hoc command
ansible $CLIENT -b -m file -a "path=/etc/newfolder state=directory mode=0755"
