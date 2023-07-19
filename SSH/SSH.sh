#!/bin/bash
read -p "Enter the desired SSH port: " ssh_port
sed -i "s/^#*Port.*/Port $ssh_port/" /etc/ssh/sshd_config
ufw allow $ssh_port/tcp
systemctl daemon-reload
service ssh restart
echo "SSH port has been updated to $ssh_port"