#!/bin/bash
echo 'deb http://archive.ubuntu.com/ubuntu jammy main restricted' > /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy main restricted' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-updates main restricted' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-updates main restricted' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy universe' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy universe' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-updates universe' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-updates universe' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-updates multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-updates multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-backports main restricted universe multiverse' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-security main restricted' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-security main restricted' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-security universe' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-security universe' >> /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu jammy-security multiverse' >> /etc/apt/sources.list
echo 'deb-src http://archive.ubuntu.com/ubuntu jammy-security multiverse' >> /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get upgrade -y
modprobe tcp_cubic
sudo sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
sudo sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
sudo sh -c 'echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf'
sudo sh -c 'echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf'
sudo sysctl -p
sudo sed -i '/nameserver/d' /etc/resolv.conf
sudo sh -c 'echo "nameserver 1.1.1.1" >> /etc/resolv.conf'
sudo sh -c 'echo "options edns0 trust-ad" >> /etc/resolv.conf'
sudo sh -c 'echo "search ." >> /etc/resolv.conf'
sudo sh -c 'echo "#!/bin/bash" > /usr/local/bin/update_resolv_conf.sh'
sudo sh -c 'echo "echo "nameserver 1.1.1.1" > /etc/resolv.conf" >> /usr/local/bin/update_resolv_conf.sh'
sudo sh -c 'echo "echo "options edns0 trust-ad" >> /etc/resolv.conf" >> /usr/local/bin/update_resolv_conf.sh'
sudo sh -c 'echo "echo "search ." >> /etc/resolv.conf" >> /usr/local/bin/update_resolv_conf.sh'
sudo chmod +x /usr/local/bin/update_resolv_conf.sh
sudo (crontab -l ; echo "*/15 * * * * /usr/local/bin/update_resolv_conf.sh") | crontab -
sudo sed -i '$a net.ipv4.icmp_echo_ignore_all=1' /etc/sysctl.conf
chmod +x /usr/local/bin/update_resolv_conf.sh
sudo sysctl -p
sudo systemctl restart systemd-resolved.service
echo "Finish"
