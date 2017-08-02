# -*- coding: utf-8 -*-
# !/usr/bin/env python
import paramiko
import os

hostname = '172.16.4.68'
username = 'root'
password = 'lablab'
paramiko.util.log_to_file('syslogin.log')

client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect(hostname=hostname, port=22, username=username, password=password, timeout=4)
stdin, stdout, stderr = client.exec_command('ulimit -u 6400')
print stdout.read()
tdin, tdout, tderr = client.exec_command('ulimit -a')
print tdout.read()
client.close()