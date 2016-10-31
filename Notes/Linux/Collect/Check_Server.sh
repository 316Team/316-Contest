#!/bin/bash
ps_out=`ps -ef | grep $1 | grep -v 'grep' | grep -v $0`
# 单独打印出需要检查的服务
result=$(echo ${ps_out} | grep "$1")
# 去除打印出的空格 ？？？
if [[ "$result" != "" ]];then
    echo "Running"
else
    echo "Not Running"
    tail -f /var/log/faillog &
   # 需重启的服务
fi
# 用法: ./scan.sh 需要检查的服务内容
# 如：ps -ef | grep tail
# 此处的 tail 就是需要检查的服务内容