#!/usr/bin/env python
# -*- coding: utf-8 -*-

from fabric.api import *

env.hosts = ['asura@192.168.56.104:22']
env.password = '000000'


def mongo_start():
    with cd("/home/asura/mongodb/bin/"):
        # 进入 mongo 所在文件夹
        run("./mongod")
        # 启动 mongo


def mongo_ps():
    run("ps -aux | grep mongo")


def mongo_stop():
    run("kill -2 $(ps -aux | grep mongo | awk 'NR==2{print $2}')")