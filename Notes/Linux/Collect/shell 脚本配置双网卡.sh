#!/bin/bash
#double network cards bond

cd /etc/sysconfig/network-scripts
cp ifcfg-eth0 /tmp/ifcfg-eth0.bak
cp ifcfg-eth1 /tmp/ifcfg-eth1.bak
#cp ifcfg-eth0 ifcfg-bond0
#vim eth0
cat ifcfg-eth0 | grep -i hwaddr > ifcfg-eth0.txt
#在HWADDR匹配行前插入SLAVE=yes，以此类推，此处也可以用echo输入来完成
sed -i '/HWADDR/ i SLAVE=yes' ifcfg-eth0.txt
sed -i '/SLAVE/ i MASTER=bond0' ifcfg-eth0.txt
sed -i '/MASTER/ i BOOTPROTO=none' ifcfg-eth0.txt
sed -i '/BOOTPROTO/ i DEVICE=eth0' ifcfg-eth0.txt
sed -i '/HWADDR/ a IPV6INIT=no' ifcfg-eth0.txt
sed -i '/IPV6INIT/ a ONBOOT=yes' ifcfg-eth0.txt
sed -i '/ONBOOT/ a TYPE=Ethernet' ifcfg-eth0.txt
sed -i '/TYPE/ a PEERDNS=yes' ifcfg-eth0.txt
sed -i '/PEERDNS/ a USERCTL=no' ifcfg-eth0.txt
cat ifcfg-eth0.txt > ifcfg-eth0
#vim eth1
#在匹配DEVICE行，将（y指所有）0替换成1，即eth0替换为eth1
sed -i '/DEVICE/y/0/1/' ifcfg-eth0.txt
#变量linehwaddr为取出eth1的MAC地址``为通配符
linehwaddr=`cat /etc/sysconfig/network-scripts/ifcfg-eth1 | grep -i hwaddr`
#将eth0的MAC的地址替换为eth1的MAC地址
sed -i '/HWADDR/c\'"$linehwaddr"'' ifcfg-eth0.txt
cat ifcfg-eth0.txt > ifcfg-eth1
#vim bond0
#脚本通用，只需改下列后五个网段，网址，网关，广播地址，子网掩码即可，按实际情况处理
echo "DEVICE=bond0" > ifcfg-bond0
echo "BOOTPROTO=none" >> ifcfg-bond0
echo "IPV6INIT=no" >> ifcfg-bond0
echo "ONBOOT=yes" >> ifcfg-bond0
echo "TYPE=Ethernet" >> ifcfg-bond0
echo "PEERDNS=yes" >> ifcfg-bond0
echo "USERCTL=no" >> ifcfg-bond0
echo "NETMASK=255.255.255.0" >> ifcfg-bond0
echo "IPADDR=10.1.1.250" >> ifcfg-bond0
echo "GATEWAY=10.1.1.1" >> ifcfg-bond0
echo "BROADCAST=10.1.1.255" >> ifcfg-bond0
echo "NETWORK=10.1.1.0" >> ifcfg-bond0
#vim /etc/modprobe.conf
#追加
echo "alias bond0 bonding" >> /etc/modprobe.conf
echo "options bond0 miimon=100 mode=1" >> /etc/modprobe.conf
#vim /etc/rc.d/rc.local
echo "ifenslave bond0 eth0 eth1" >> /etc/rc.d/rc.local
rm -rf /etc/sysconfig/network-scripts/ifcfg-eth0.txt
#重启网络
ifconfig bond0 up
service network restart
echo "double network cards bond complete!"