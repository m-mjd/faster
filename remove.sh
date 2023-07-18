crontab -l | grep -v "wget https://github.com/m-mjd/faster/raw/main/faster.sh -O - | bash" | crontab -
rm -f /usr/local/bin/update_resolv_conf.sh
sed -i '/net.ipv4.icmp_echo_ignore_all=1/d' /etc/sysctl.conf
echo "" > /etc/resolv.conf
modprobe tcp_cubic
sed -i '/net.core.default_qdisc/d' /etc/sysctl.conf
sed -i '/net.ipv4.tcp_congestion_control/d' /etc/sysctl.conf
sh -c 'echo "net.core.default_qdisc = fq" >> /etc/sysctl.conf'
sh -c 'echo "net.ipv4.tcp_congestion_control = cubic" >> /etc/sysctl.conf'
sysctl -p
sh -c 'echo "nameserver 127.0.0.53" >> /etc/resolv.conf'
systemctl restart systemd-resolved.service
echo "All changes have been reverted."
echo "Your system will reboot."
reboot
