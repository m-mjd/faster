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
apt-get update -y
apt install ufw
apt instal net-tools -y
apt install resolvconf -y
echo "net.core.default_qdisc = fq" | tee -a /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control = bbr" | tee -a /etc/sysctl.conf
sysctl -p
echo "tcp_bbr" | tee -a /etc/modules-load.d/modules.conf
modprobe tcp_bbr
sysctl -w net.ipv4.tcp_congestion_control=bbr
sysctl -w net.core.default_qdisc=fq
sed -i '$a net.ipv4.icmp_echo_ignore_all=1' /etc/sysctl.conf
sysctl -p
(crontab -l ; echo "0 */6 * * * echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a && printf '\n%s\n' 'Ram-cache and Swap Cleared'") | crontab -

used_ports=$(netstat -tuln | grep LISTEN | awk '{print $4}' | awk -F: '{print $NF}' | sort -u)

allowed_ports="22 80 443"

for port in $used_ports $allowed_ports
do
    ufw allow $port
done

ufw default deny incoming
ufw default allow outgoing

for port in {1..65535}
do
    if ! [[ "$used_ports $allowed_ports" =~ "$port" ]]
    then
        ufw deny $port
    fi
done

ufw enable
echo "Finish"
