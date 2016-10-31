# 解决Linux下ulimit的问题
## *命令修改ulimit 值，重启后并不会完全生效*

- ulimit 命令

```
#ulimit -u 64000
#ulimit -s 1024
#ulimit -n 64000
```

> ulimit 命令必须在root下执行

## *更改文件设置可以永久生效*

- /etc/security/limits.conf

```
$sudo vim /etc/security/limits.conf
* hard nofile 64000
* soft nofile 64000
root hard nofile 64000
root soft nofile 64000
* hard nproc 64000
* soft nproc 64000
root hard nproc 64000
root soft nproc 64000
* hard stack 1024
* soft stack 1024
root hard stack 1024
root soft stack 1024
```

> 重启后生效

```
$sudo reboot
```

> 如果 ulimit -a 查询时，max user processes 没有生效，可以添加一个文件

```
$sudo vim /etc/security/limits.d/90-nproc.conf
* hard nproc 64000
* soft nproc 64000
root hard nproc 64000
root hard nproc 64000
```

>  " * " 星号代表所有用户<br>
>  root 代表 root 用户
