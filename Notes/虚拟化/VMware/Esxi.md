## Esxi 克隆虚拟机

首先进入`/vmfs/volumes/Data1`目录，找出需要克隆的虚拟机`manjaro`，然后新建一个目录。

```shell
[root:/vmfs/volumes/5aa7e9dc-7a13519c-81da-f01fafceebab] ls -l
total 1168
drwxr-xr-x    1 root     root          1260 Feb 14 14:44 iso
drwxr-xr-x    1 root     root          2380 Aug 31  2018 kolla
drwxr-xr-x    1 root     root          1680 Oct 18 13:07 manjaro
drwxr-xr-x    1 root     root          3360 Dec 11 15:57 openstack-controller
[root:/vmfs/volumes/5aa7e9dc-7a13519c-81da-f01fafceebab] mkdir manjaro1
[root:/vmfs/volumes/5aa7e9dc-7a13519c-81da-f01fafceebab] ls -l
total 1176
drwxr-xr-x    1 root     root          1260 Feb 14 14:44 iso
drwxr-xr-x    1 root     root          2380 Aug 31  2018 kolla
drwxr-xr-x    1 root     root          1680 Oct 18 13:07 manjaro
drwxr-xr-x    1 root     root           280 Mar 21 14:24 manjaro1
drwxr-xr-x    1 root     root          3360 Dec 11 15:57 openstack-controller
```

目录建好后，准备克隆。

```shell
[root:/vmfs/volumes/5aa7e9dc-7a13519c-81da-f01fafceebab] vmkfstools -i ./manjaro/manjaro1.vmdk ./manjaro1/manjaro1.vmdk
Destination disk format: VMFS zeroedthick
Cloning disk './manjaro/manjaro.vmdk'...
Clone: 100% done.
```

然后在控制面板上创建虚拟机，在`自定义设置`中删除当前的硬盘，选择添加硬盘。

![esxi_del_hard](../../image/esxi_del_hard.png)