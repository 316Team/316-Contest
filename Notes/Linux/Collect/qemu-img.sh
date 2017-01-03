#!/bin/bash
# for 循环遍历 convert 文件夹内的文件夹
# while 循环遍历 convert 文件夹下的各文件夹内的文件
# qemu-img 将 qcow2 格式转为 raw 格式
filelist=`ls ./convert/`
for file in $filelist;do
echo $file
cd ./$file
cat ./convert/$file | while read line;do
echo $line
#test=`cd ./$file`
#echo $test
convert=`qemu-img convert -f qcow2 -O raw ${line}.qcow2 ${line}.img`
echo $convert
done
done
