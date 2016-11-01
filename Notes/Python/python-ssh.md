# 安装paramiko 模块

安装paramiko 模块时，一直失败并且报错，会出现 Read timed out。

```
Command /usr/bin/python -c "import setuptools, tokenize;__file__='/tmp/pip_build_root/cryptography/setup.py';exec(compile(getattr(tokenize, 'open', open)(__file__).read().replace('\r\n', '\n'), __file__, 'exec'))" install --record /tmp/pip-VMrVTo-record/install-record.txt --single-version-externally-managed --compile failed with error code 1 in /tmp/pip_build_root/cryptography
Storing debug log for failure in /home/cimer/.pip/pip.log
```

还有会提示没有安装 gcc、lib-dev 、python-dev 、libffi-dev 的
这时候先安装所需的依赖包：

```
$sudo apt-get install build-essential libssl-dev libffi-dev python-dev
$sudo apt-get build-dep gcc
$sudo pip install pycrypto
$sudo pip install paramiko                                              // 如果这里安装出错，则使用下面的地址来安装
$sudo pip install paramiko -i http://pypi.douban.com/simple             // 这里的 -i 是指定安装的源地址
```

# python 建立SSH 连接

> import paramiko<br>
> client = paramiko.SSHClient()<br>
> client.set_missing_host_key_policy(paramiko.AutoAddPolicy())<br>
> client.connect('172.16.4.104', 22, username='root', password='1b9f8be1b9', timeout=4)<br>
> stdin, stdout, stderr = client.exec_command('ls -l')<br>
> for std in stdout.readlines():<br>
> 	print std,<br>
> client.close()<br>
