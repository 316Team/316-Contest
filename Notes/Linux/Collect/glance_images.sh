#!/bin/bash
# 用来获取指定镜像的详细信息
glance image-show `glance image-list | grep -i $1 | awk '{print $4}'`
# 后面是用来获取镜像的名字，如果将 $4 改成 $2 即获取镜像 ID
