#!/usr/bin/env python
from fabric.api import *

# env.hosts = ['asura@192.168.56.105:22','asura@192.168.56.104:22']
# env.hosts = ['asura@192.168.56.102:22','asura@192.168.56.104:22','asura@192.168.56.105:22']
env.hosts = ['root@192.168.56.102:22']
env.password = '000000'


def disk_space():
    # run(
    #     "echo '* hard nofile 64000 \n* soft nofile 64000 \nroot hard nofile 64000 \n"
    #     "root soft nofile 64000 \n* hard stack 1024 \n* soft stack 1024 \nroot hard stack 1024 "
    #     "\nroot soft stack 1024 \n* hard nproc 34000 \n* soft nproc 34000 \nroot hard nproc 34000 "
    #     "\nroot soft nproc 34000' >> /etc/security/limits.conf")
    run("cat /etc/security/limits.conf | grep -v ^$ | grep -v ^#")
    run("reboot")
