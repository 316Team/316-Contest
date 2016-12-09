#!/bin/bash
n=1
echo "check httpd server"
while true
do
	if test $n -gt 20
	then
		echo "httpd server failed"
		break
	fi

	sleep 5
	n=$(($n+1))
	port=`netstat -antp | grep "0.0.0.0:2333"`
	if [ ${#port} -gt 3 ];then
		echo "httpd server success"
		break;
	fi
done
