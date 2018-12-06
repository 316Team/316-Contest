- 提取文本的第一行

```bash
$awk 'NR==1{print}' file_name
```

- 利用`split`分割字符串,将指定ip单独提取

```bash
$xe vm-list name-label=Rep params=networks
    networks (MRO)    : 1/ip: 1.1.1.3; 1/ipv6/0: fe80::547b:89ff:fecb:8583; 0/ip: 172.16.2.202; 0/ipv6/0: fe80::fca9:20ff:fee9:b97e
$xe vm-list name-label=Rep params=networks | awk '{split($0,a,"0/ip:"); print a[2]}' | awk '{print $1}' | awk '{split ($0,a,";"); print a[1]}'
    172.16.2.202
```

- 取出圆括号内的字符串

```bash
$ echo "xxx(zifuchuang)xxx" | awk -F "[()]" '{print $2}'
zifuchuang
```
