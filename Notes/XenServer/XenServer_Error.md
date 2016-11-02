- 出现的问题：

> 双网卡时，改了eth0 的ip地址，但是eth1 的ip 地址也变得跟eth0 的ip地址一样了

```
#xe pif-list
#xe pif-reconfig-ip mode=static ip=192.168.56.109 netmask=255.255.255.0 gateway=192.168.56.1
```

> 上面的uuid 是 pif-list 获取的 uuid 号，ip 地址可以改成自己想要的ip

- NIC 未与 主机连接：<br>
![](https://github.com/316Team/316-Contest/blob/316Team/image/XenServer_Disconnected.png)<br>

- 在 XenCenter 本地 Shell 中开启端口：

``#ifconfig eth* up``

> XenServer 虚拟机启不来，可能是主机的虚拟化没有开
