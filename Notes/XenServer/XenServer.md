> Server机：<br>
> /etc/xapi.d/plugins// 用来存放自定义脚本的目录

## 如何把ISO上传至XenServer本地存储

> 用户要挂载ISO进行虚拟机安装时，ISO来自何处？有两种方法：<br>
> 一、通过CIFS挂载Windows共享文件夹的方式，这种方式操作简单，通过XenCenter的New Storage的向导即可完成（操作略），而且当ISO较多且变动频繁时，强力推荐该种方法。<br>
> 二、将ISO文件直接上传到XenServer主机系统中，适合与ISO较少且容量不大，不便于提供Windows共享文件服务器的环境。

- 上传ISO镜像的方法：

#### 0x1 查看vg: `vgdisplay`

#### 0x2 创建逻辑卷： `lvcreate -L 10GB -n iso VG_XenStorage-21852236-7151-e287-a618-b-2-6aa23846`

#### 0x3 格式化： `mkfs.ext3 /dev/VG_XenStorage-21852236-7151-e287-a618-b0206aa23846/iso`

#### 0x4 创建挂载目录： `mkdir /opt/iso`

#### 0x5 创建ISO存储： `xe sr-create name-label=ISOs type=iso device-config:location=/opt/iso/ ISOs device-config:legacy_mode=true content-type=iso`

#### 0x6 完成： 在xen客户端会出现ISO存储，把镜像上传到/opt/iso，刷新ISO后即可在ISO存储中看到上传的镜像
