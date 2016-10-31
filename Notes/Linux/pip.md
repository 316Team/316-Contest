- ubuntu 下安装pip

```
$sudo apt-get install python-dev python-pip build-essential
```
- 使用pypi镜像源加速第三方库在线安装

```
#在Linux 下修改 ~/.pip/pip.conf ，如果没有则创建这个文件。
$sudo vim ~/.pip/pip.conf
[global]
index-url = http://pypi.douban.com/simple
[install]
trusted-host = pypi.douban.com
```

- 在线下载并安装pip

```
$wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
$python get-pip.py
$pip --version  //验证是否安装成功
```