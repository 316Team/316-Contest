- 添加一条端口映射规则：

```
$sudo iptables -t nat -A DOCKER -p tcp --dport 8002 -j DNAT --to-destination 172.17.0.2:80
# 将 172.17.0.2 的 docker 容器的 80 端口映射到宿主机的 8002 端口
$sudo iptable -t nat -nvL
# 查看 iptables 规则列表
```

- 删除添加的规则：

```
$sudo iptables -t nat DOCKER NUMBER
# DOCKER 是 iptables -t nat -n vL 查出来的第二列的值
$sudo iptables -t nat POSTROUTING NUMBER
# NUMBER 是该规则所在 POSTROUTING 的第几行
```

- 查询并删除规则

```
$sudo iptables -t nat -L -n --line-numbers
$sudo iptables -t nat -D POSTROUTING NUMBER
```

- 同网段ip间的端口转发

> 以下是ubuntu系统,操作都是在 `192.168.56.105` 上<br>
> 将`192.168.56.104`上的`80`端口转发到`192.168.56.105`的`8888`端口上<br>
> 首先开启路由转发功能<br>
> ```bash
> $sudo vim /etc/sysctl.conf    //永久开启路由转发功能
>   net.ipv4.ip_forward=1
> $sudo sysctl -p /etc/sysctl.conf      //更改到文件中
>   net.ipv4.ip_forward=1
> $cat /proc/sys/net/ipv4/ip_forward    //查看，1为启用，0为关闭
>   1
> $sudo /etc/init.d/procps restart  //重启procps服务
>```
> 配置`iptables`规则
> ```bash
> $sudo iptables -t nat -A PREROUTING -d 192.168.56.105 -p tcp --dport 8888 -j DNAT --to-destination 192.168.56.104:80
> $sudo iptables -t nat -A POSTROUTING -d 192.168.56.104 -p tcp --dport 80 -j SNAT --to 192.168.56.105
> $sudo iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
> $sudo iptables-save > /etc/iptables.rules
> $sudo vim /etc/network/interfaces     //网卡配置文件，加上下面这句
>   pre-up iptables-restore < /etc/iptables.rules   //启用网卡时加载
> ```

- 不同网段间的端口转发

> 在本地虚拟机上，将`eth0:192.168.2.2`上的`80`端口转发到本地虚拟机`eth0:172.168.1.152`的`9999`端口上<br>
> 之前的配置是一样的<br>
> 配置 `iptables`规则
> ```bash
> $sudo iptables -t nat -A PREROUTING  -d 172.168.1.152 -i eth0 -p tcp --dport 9999 -j DNAT --to-destination 192.168.2.2:80
> $sudo iptables -t nat -A POSTROUTING -d 192.168.2.2/32 -p tcp --dport 80 -j MASQUERADE
> ```

- 保存`iptables`规则

> centos
> ```bash
> #/sbin/service iptables save
> ```

- 针对端口转发只允许指定ip访问

> 在本地虚拟机上,将`eth0:192.168.2.2`上的`80`端口转发到本地虚拟机`eth0:172.168.1.152`的`9999`端口上,但是只允许`192.168.120.25`访问<br>
> 之前的配置是一样的<br>
> 配置 `iptables`规则
> ```bash
> $sudo iptables -t nat -A PREROUTING  -d 172.168.1.152 -i eth0 -p tcp --dport 9999 -s 192.168.120.25 -j DNAT --to-destination 192.168.2.2:80
> $sudo iptables -t nat -A POSTROUTING -d 192.168.2.2/32 -p tcp --dport 80 -j MASQUERADE
> ```
