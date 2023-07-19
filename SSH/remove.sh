#!/bin/bash
ssh_port=22
sed -i "s/^#*Port.*/Port $ssh_port/" /etc/ssh/sshd_config
ufw allow $ssh_port/tcp
systemctl daemon-reload
service ssh restart
echo "SSH port has been updated to $ssh_port"