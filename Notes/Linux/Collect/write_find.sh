#!/bin/bash
# 遍历文件，$1 是输入文件名
# 将 find 查找到的文件路径写进 3.txt
# bash write_find.sh 2.txt
cat $1 | while read line
do
    echo "File:${line}"
    path=`find /home/ -iname ${line}.qcow2`
    echo "$path"
    echo $path >> 3.txt
done
