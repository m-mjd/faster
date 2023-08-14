#!/bin/bash

# Add valid repository for Ubuntu version
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) main restricted" > /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs) main restricted" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates main restricted" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates main restricted" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) universe" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs) universe" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates universe" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates universe" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs) multiverse" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs) multiverse" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates multiverse" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-updates multiverse" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-backports main restricted universe multiverse" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security main restricted" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security main restricted" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security universe" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security universe" >> /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security multiverse" >> /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -cs)-security multiverse" >> /etc/apt/sources.list

# Configure DNS settings
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 208.67.222.222" >> /etc/resolv.conf
echo "nameserver 208.67.220.220" >> /etc/resolv.conf
echo "nameserver 95.85.95.85" >> /etc/resolv.conf
echo "nameserver 2.56.220.2" >> /etc/resolv.conf
echo "nameserver 2001:4860:4860::8888" >> /etc/resolv.conf
echo "nameserver 2606:4700:4700::1111" >> /etc/resolv.conf
echo "options edns0 trust-ad" >> /etc/resolv.conf
echo "search ." >> /etc/resolv.conf

# Update and install required packages
apt update
apt install ufw net-tools resolvconf python3 -y

# Configure sysctl settings
echo "net.core.default_qdisc = fq" | tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" | tee -a /etc/sysctl.conf
sysctl -p

# Configure TCP BBR
echo "tcp_bbr" | tee -a /etc/modules-load.d/modules.conf
modprobe tcp_bbr
echo "net.ipv4.tcp_congestion_control=bbr" > /etc/sysctl.d/99-bbr.conf

# Configure ICMP ignore
echo "net.ipv4.icmp_echo_ignore_all=1" >> /etc/sysctl.conf
sysctl -p

# Configure UFW
ufw default deny incoming
ufw default allow outgoing
used_ports=$(ss -tuln | awk 'NR>1 {print $4}' | awk -F: '{print $NF}' | sort -u)
allowed_ports="22 80 443"
for port in $used_ports $allowed_ports
do
    ufw allow $port
done
ufw enable

echo "Finish"
