#!/bin/bash
# RHCE 系列第四部分示例脚本
# 该脚本会返回以下这些系统信息：
# -主机名称:
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
hostnamectl
echo ""
# -文件系统磁盘空间使用：
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -系统空闲和使用中的内存：
echo -e "\e[31;43m ***** FREE AND USED MEMORY *****\e[0m"
free -h
echo ""
# -系统启动时间：
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -登录的用户：
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
echo ""
# -使用内存最多的 5 个进程
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "\e[1;32mDone.\e[0m"
