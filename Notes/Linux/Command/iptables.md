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
# DOCKER 是 iptables -t nat -nvL 查出来的第二列的值
$sudo iptables -t nat POSTROUTING NUMBER
# NUMBER 是该规则所在 POSTROUTING 的第几行
```