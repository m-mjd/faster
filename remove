crontab -l | grep -v "wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash"  | crontab -
rm -f /usr/local/bin/update_resolv_conf.sh
sed -i '/net.ipv4.icmp_echo_ignore_all=1/d' /etc/sysctl.conf
sed -i '/nameserver 1.1.1.1/d' /etc/resolv.conf
sed -i '/options edns0 trust-ad/d' /etc/resolv.conf
sed -i '/search \./d' /etc/resolv.conf
sed -i '/deb http:\/\/archive.ubuntu.com\/ubuntu jammy/d' /etc/apt/sources.list
sed -i '/deb-src http:\/\/archive.ubuntu.com\/ubuntu jammy/d' /etc/apt/sources.list
apt-get update -y
modprobe tcp_cubic
sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
sh -c 'echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf'
sh -c 'echo "net.ipv4.tcp_congestion_control = cubic" >> /etc/sysctl.conf'
sysctl -p
sed -i '/nameserver/d' /etc/resolv.conf
sh -c 'echo "nameserver 127.0.0.53" >> /etc/resolv.conf'
systemctl restart systemd-resolved.service
echo "All changes have been reverted."
