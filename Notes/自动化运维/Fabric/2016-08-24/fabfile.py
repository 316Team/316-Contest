#!/usr/bin/env python
from fabric.api import abort, cd, env, get, hide, hosts, local, prompt, \
    put, require, roles, run, runs_once, settings, show, sudo, warn
# 调用 fabric api 模块
from fabric.colors import *
# 调用 fabric colors 模块

# env.hosts = ['192.168.56.104','192.168.56.105','192.168.56.102']
env.hosts = ['192.168.56.104']
# 定义连接主机的用户名、IP和端口
# env.password = '000000'
# 连接主机的密码


def show():
    print green('success')
    print red('fail')
    print yellow('yellow')


def echo():
    sudo("docker restart gitlab")


def disk_space():
    run('df -h')


def all():
    show()
    disk_space()
