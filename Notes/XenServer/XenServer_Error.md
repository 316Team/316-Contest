1. 出现的问题：

> 双网卡时，改了eth0 的ip地址，但是eth1 的ip 地址也变得跟eth0 的ip地址一样了

```
#xe pif-list
#xe pif-reconfig-ip mode=static ip=192.168.56.109 netmask=255.255.255.0 gateway=192.168.56.1
```

> 上面的uuid 是 pif-list 获取的 uuid 号，ip 地址可以改成自己想要的ip

2. NIC 未与 主机连接：<br>

![](https://raw.githubusercontent.com/316Team/316-Contest/316Team/image/XenServer_Disconnected.png)<br>

在 XenCenter 本地 Shell 中开启端口：

``#ifconfig eth* up``

3. 当'XenServer'内的'VM'启动时出现'hvm is required for this operation'时，且虚拟机启不来，很可能是因为当前设备未开虚拟化
4. 如果XenServer 刚装好时，发现 `Local Storage`呈错误状态，如下图-1：![XenServer_Local_Storage_error](https://raw.githubusercontent.com/316Team/316-Contest/316Team/image/XenServer_Local_Storage_error.png)


<p align="center">图-1</p>

   - 首先移除`Local Storage` ：

     ```shell
     [root@Xen ~]# xe sr-list name-label=Local\ storage
     uuid ( RO)                : 8ecdc000-c195-6403-ab67-1de1e32c7782
               name-label ( RW): Local storage                                          
         name-description ( RW):
                     host ( RO): 迷宫 出货版 [192.168.5.24]                                
                     type ( RO): ext                                   
             content-type ( RO): user                    
     [root@Xen ~]# xe pbd-list sr-uuid=8ecdc000-c195-6403-ab67-1de1e32c7782
     uuid ( RO)                  : f090e706-57bc-eece-3e8f-1e7980b0b508                   host-uuid ( RO): b67fea44-4863-490f-85dc-5d09b4db6994
                    sr-uuid ( RO): 8ecdc000-c195-6403-ab67-1de1e32c7782
              device-config (MRO): device: /dev/disk/by-id/ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y-part3                                                         
         currently-attached ( RO): false                                                 
     [root@Xen ~]# xe pbd-unplug uuid=f090e706-57bc-eece-3e8f-1e7980b0b508
     [root@Xen ~]# xe sr-forget uuid=8ecdc000-c195-6403-ab67-1de1e32c7782
     ```

- 然后再创建新的`Local Storage`：

  ```shell
  [root@Xen ~]# xe host-list
  uuid ( RO)                : b67fea44-4863-490f-85dc-5d09b4db6994
            name-label ( RW): 迷宫 出货版 [192.168.5.24]
      name-description ( RW): Default install
  [root@Xen ~]# xe sr-create content-type=user device-config:device=/dev/disk/by-id/ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y-part3 host-uuid=b67fea44-4863-490f-85dc-5d09b4db6994 name-label="Local storage" shared=false type=lvm
  5d088046-e50a-271f-a163-8b818e40021a
  # 此处的device 可以使用 ll /dev/disk/by-id/  查询
  [root@Xen ~]# ll /dev/disk/by-id/
  总用量 0                                                   
  lrwxrwxrwx 1 root root  9 7月  13 14:46 ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y -> ../../sda
  lrwxrwxrwx 1 root root 10 7月  13 14:46 ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y-part1 -> ../../sda1
  lrwxrwxrwx 1 root root 10 7月  13 14:46 ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y-part2 -> ../../sda2
  lrwxrwxrwx 1 root root 10 7月  13 14:46 ata-WDC_WD4002FYYZ-01B7CB0_N8GUM98Y-part3 -> ../../sda3
  ............
  lrwxrwxrwx 1 root root 10 7月  13 14:46 wwn-0x5000cca244cba5b9-part6 -> ../../sda6
  ```

- 若创建时出现 ”*The SR operation cannot be performed because a device underlying the SR is in use by the host.*“ 提示，则先重启 XenServer。若是重启后创建还出现此提示，则需要将`xe sr-list` 所查询到的全部移除，除了 ”**XenServer Tools ISOs **“ 是不可以移除的。

- 创建完成后将 "Local Storage" 设置为默认存储。如图-2

![XenServer_Local_Storage_default](https://raw.githubusercontent.com/316Team/316-Contest/316Team/image/XenServer_Local_Storage_default.jpg)

<p align="center">图-2</p>