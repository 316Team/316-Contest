#!/bin/bash
# 遍历文件
# 断点续传 cp突然中断的文件
cat $1 | while read line
do
    cp -aufv $line updatetemplate/
# -u 是 update file
    echo "$line"
done
