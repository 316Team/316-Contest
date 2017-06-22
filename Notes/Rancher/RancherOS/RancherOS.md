# RancherOS

[TOC]

## RancherOS 安装

1. 添加`IP`

  ```shell
  $ sudo ip addr add 192.168.2.3/24 dev eth0
  $ sudo route add default gw 192.168.2.1
  $ sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
  ```

2. 编辑`cloud-config.yml`文件

  ```bash
  #cloud-config
  ssh_authorized_keys:
  # 此处为可信任主机的公钥
    - ssh-rsa AAAAAAAAAAXXXXXXXXXXXXXXXXXX jim@jim
  # hostname 可自定义
  hostname: rancheros01
  rancher:
    network:
      interfaces:
  # 定义主机IP和dns
        eth0:
          address: 192.168.0.102/24
      gateway: 192.168.0.1
      mtu: 1500
      dhcp: false
      dns:
        nameservers:
          - 8.8.8.8
  ```

3. 检测`cloud-config.yml`文件，并安装

  ```shell
  $ sudo ros c validate -i cloud-config.yml
  $ sudo cp -rfv cloud-config.yml /var/lib/rancher/conf/
  $ sudo ros install -c cloud-config.yml -d /dev/sda
  ```

此处的`/dev/sda`为主机挂载设备，可用`fdisk -l`查看，安装提示是否继续，确认`y`；成功后提示是否重启，则不重启`n`.然后手动关机，将`ISO`镜像移除后开机.
