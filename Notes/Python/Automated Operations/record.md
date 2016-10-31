# 记录一些Python自动化运维中遇到的问题

- ssh 使用 root 用户远程连接ubuntu系统

```
$sudo vim /etc/ssh/sshd_config
PermitRootLogin without-password
替换成
PermitRootLogin yes
$sudo service ssh restart
```