#!/bin/bash

SOCKS_IP=hk02-37.ssv7.net

function start(){
	sudo killall redsocks
	sudo redsocks

	sudo iptables -t nat -A OUTPUT -d $SOCKS_IP -j RETURN
 
	#不重定向私有地址的流量
	sudo iptables -t nat -A OUTPUT -d 10.0.0.0/8 -j RETURN
	sudo iptables -t nat -A OUTPUT -d 172.16.0.0/16 -j RETURN
	sudo iptables -t nat -A OUTPUT -d 192.168.0.0/16 -j RETURN
 
	#不重定向保留地址的流量,这一步很重要
	sudo iptables -t nat -A OUTPUT -d 127.0.0.0/8 -j RETURN
 
	#重定向所有不满足以上条件的流量到redsocks监听的12345端口
	sudo iptables -t nat -A OUTPUT -p tcp -j REDIRECT --to-ports 12345
}

function stop(){
        sudo iptables -t nat -D OUTPUT 6
        sudo iptables -t nat -D OUTPUT 5
        sudo iptables -t nat -D OUTPUT 4
        sudo iptables -t nat -D OUTPUT 3
        sudo iptables -t nat -D OUTPUT 2
        sudo iptables -t nat -D OUTPUT 1
        sudo killall redsocks
}

case $1 in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  *)
    echo "Usage $0 {start|stop}"
    ;;
esac
