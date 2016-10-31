- MySQLdb

ubuntu 下：

```
$sudo apt-get instll python-mysqldb
```

Windows 下：
> 下载 MySQL-python-1.2.3.win-amd64-py2.7.exe<br>
> 网址：https://victorjabur.com/2011/06/08/modules-python-library-compiled-for-windows-32-and-64-unofficial-windows-binaries-for-python/
下载好之后直接安装就行了

- mysql.connector

下载 mysql.connector 的源码

```
$tar -zxvf mysql-connector-python-2.1.3.tar.gz
$cd mysql-connector-python-2.1.3
$python setup.py install
$python
>>>import mysql.connector
>>>  //没有返回表示安装成功
```