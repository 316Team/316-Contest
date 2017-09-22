#!/bin/bash

log_error="$(tail -n 10 /var/log/shadowsocks.log | grep ERROR)"

while true
do
        sleep 10
        if [[ "$log_error" != "" ]];then
		service shadowsocks restart
		echo "$log_error" >> /root/shadowsocks_run.log
        else
		echo "$(tail -n 10 /var/log/shadowsocks.log | grep INFO)" >> /root/shadowsocks_run.log
        fi
done
