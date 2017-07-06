> Server机：<br>
> /etc/xapi.d/plugins// 用来存放自定义脚本的目录

## 如何把ISO上传至XenServer本地存储

> 用户要挂载ISO进行虚拟机安装时，ISO来自何处？有两种方法：<br>
> 一、通过CIFS挂载Windows共享文件夹的方式，这种方式操作简单，通过XenCenter的New Storage的向导即可完成（操作略），而且当ISO较多且变动频繁时，强力推荐该种方法。<br>
> 二、将ISO文件直接上传到XenServer主机系统中，适合与ISO较少且容量不大，不便于提供Windows共享文件服务器的环境。

- 上传ISO镜像的方法：

#### 0x0 创建挂载目录： `mkdir /opt/iso`

#### 0x1 创建ISO存储： `xe sr-create name-label=ISOs type=iso device-config:location=/opt/iso/ device-config:legacy_mode=true content-type=iso`

#### 0x2 完成： 在xen客户端会出现ISO存储，把镜像上传到/opt/iso，刷新ISO后即可在ISO存储中看到上传的镜像

- 安装 xen-tools

> 点击安装 `xen-tools`，或者在 `Console` 下的 `DVD Driver1:` 直接挂载 `guest-tools.iso` 盘，进入需要装 `xen-tools` 的虚拟机，挂载镜像到 `/mnt`，`sudo mount /dev/sr0 /mnt`（这里不一定是``），然后直接安装 `sudo /mnt/Linux/install.sh`，安装结束重启一下就好了。

- 修改`XenServer`网卡顺序
  1. 使用`xe pif-forget`掉需要修改的`NIC`
  2. 使用`xe network-destroy`销毁`NIC`对应的`xenbr`接口
  3. 修改`/etc/sysconfig/network-scripts/interface-rename-data/dynamic-rules.json`文件，对`lastboot`下的`NIC name`进行修改，并注释掉不用的`OLD`下的`NIC`
  4. 保存重启`XenServer`
  5. `xe pif-scan` 扫描本地`NIC`
  6. `xe pif-list` 检查`NIC`是否正常
