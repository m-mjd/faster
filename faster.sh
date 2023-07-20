#!/bin/bash
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy main restricted' > /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy main restricted' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-updates main restricted' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-updates main restricted' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy universe' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy universe' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-updates universe' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-updates universe' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy multiverse' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy multiverse' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-updates multiverse' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-updates multiverse' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-security main restricted' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-security main restricted' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-security universe' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-security universe' >> /etc/apt/sources.list
echo 'deb http://us.archive.ubuntu.com/ubuntu jammy-security multiverse' >> /etc/apt/sources.list
echo 'deb-src http://us.archive.ubuntu.com/ubuntu jammy-security multiverse' >> /etc/apt/sources.list
sed -i '/nameserver/d' /etc/resolv.conf
sh -c 'echo "nameserver 208.67.222.222" >> /etc/resolv.conf'
sh -c 'echo "nameserver 208.67.220.220" >> /etc/resolv.conf'
sh -c 'echo "nameserver 95.85.95.85" >> /etc/resolv.conf'
sh -c 'echo "nameserver 2.56.220.2" >> /etc/resolv.conf'
sh -c 'echo "nameserver 2001:4860:4860::8888" >> /etc/resolv.conf'
sh -c 'echo "nameserver 2606:4700:4700::1111" >> /etc/resolv.conf'
sh -c 'echo "options edns0 trust-ad" >> /etc/resolv.conf'
sh -c 'echo "search ." >> /etc/resolv.conf'
apt install ufw
apt instal net-tools -y
apt install resolvconf -y
apt install python3 -y
echo "net.core.default_qdisc = fq" | tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" | tee -a /etc/sysctl.conf
sysctl -p
echo "tcp_bbr" | tee -a /etc/modules-load.d/modules.conf
modprobe tcp_bbr
sysctl -w net.ipv4.tcp_congestion_control=bbr
sysctl -w net.core.default_qdisc=fq
sed -i '$a net.ipv4.icmp_echo_ignore_all=1' /etc/sysctl.conf
sysctl -p
wget https://github.com/m-mjd/faster/raw/main/firewall_setup.py
python3 firewall_setup.py
echo "Finish"
