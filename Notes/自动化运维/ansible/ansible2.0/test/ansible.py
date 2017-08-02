#!/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import json
from collections import namedtuple
from ansible.parsing.dataloader import DataLoader
from ansible.vars import VariableManager
from ansible.inventory import Inventory
from ansible.executor.playbook_executor import PlaybookExecutor


def install(request):
    if 'ip' in request.GET:
        ip = request.GET['ip']
        host = []
        host.append(ip)
        # 传入一个host列表
        variable_manager = VariableManager()
        loader = DataLoader()
        inventory = Inventory(loader=loader, variable_manager=variable_manager, host_list=host)
        playbook_path = 'E:/len/Basic_Virtual/huful/ansible/ansible2.0/test/main.yml'
        # 传入一个playbook路径
        Options = namedtuple('Options', ['listtags', 'listtasks', 'listhosts', 'syntax', 'connection',
                                         'module_path', 'forks', 'remote_user', 'private_key_file',
                                         'ssh_common_args', 'ssh_extra_args', 'sftp_extra_args', 'scp_extra_args',
                                         'become', 'become_method', 'become_user', 'verbosity', 'check'])
        options = Options(listtags=False, listtasks=False, listhosts=False, syntax=False, connection='ssh',
                          module_path=None, forks=100, remote_user='root', private_key_file=None,
                          ssh_common_args=None, ssh_extra_args=None, sftp_extra_args=None, scp_extra_args=None,
                          become=True, become_method=None, become_user='root', verbosity=None, check=False)
        passwords = {}
        pbex = PlaybookExecutor(playbooks=[playbook_path], inventory=inventory,
                                variable_manager=variable_manager, loader=loader, options=options,
                                passwords=passwords)
        results = pbex.run()
        # 返回的结果是数字，不同的结果对应不同的数字
        return 1
    else:
        return 0
