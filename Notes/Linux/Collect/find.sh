#!/bin/bash
# 使用 ./find.sh FILENAME
path=`find . -name $1.qcow2`
# . 是当前目录  $1 是读取输入
echo $path
if [ ! -d $path ];then
    # -d 是文件是否为目录
    cp $path 1215/ &
    echo "success"
fi
