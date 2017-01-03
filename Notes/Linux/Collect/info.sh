#!/bin/bash
# 遍历当前文件夹内的文件名
# 获取当前文件夹内文件的镜像名
# 获取当前文件夹内文件的镜像大小
# 如果 info 为非空，则 将 image info 写入 1.txt中
filelist=`ls ./`
for file in $filelist
do
echo $file
image=`qemu-img info $file | grep image`
info=`qemu-img info $file | grep 40 | awk '{print $3}'`
#info=`qemu-img info $file | grep 40 | awk '{print $3}' | cut -f1 -d 'G'`
echo $image
echo $info
if [ $info ];then
#if [ $info -ge 40 ];then
echo -e "$image\n$info\n" >> 1.txt
fi
done
