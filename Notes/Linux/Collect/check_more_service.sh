#!/bin/bash

result=$(ps -ef | grep -oP 'ssh|rsyslog' | sort | uniq | wc -l)
# 打印出两个服务实际运行的个数
# grep -oP 'ssh|rsyslog' 只打印包含ssh和rsyslog的部分
# sort 对打印的内容进行排序
# uniq 去除所有相同内容
# wc -l 统计打印内容的个数

if [[ "$result" != 2 ]];then
        echo "This service is not running"
else
        echo "This service is running"
fi

# 修改服务名即可使用
# 2 可修改，如服务名为3个则改为3，以此类推
