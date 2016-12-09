#!/bin/bash
echo -n "login:"
read name
echo -n "password:"
read passwd
if [ $name = "cimer" -a $passwd = "cimer" ];then
	echo "the host and paasword is right"
else echo "input is error"
fi
