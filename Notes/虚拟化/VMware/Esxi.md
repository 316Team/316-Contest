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
drwxr-xr-x    1 root     root          2240 Jan 10 13:45 dandelion-test05-centos
drwxr-xr-x    1 root     root          1680 Jan 11 13:37 dandelion_offline_ubuntu16
drwxr-xr-x    1 root     root          1820 Jan  2 16:45 dandelion_test01_centos
drwxr-xr-x    1 root     root          6440 Dec 25 13:53 dandelion_test1
drwxr-xr-x    1 root     root          3640 Dec 26 14:21 dandelion_test2
drwxr-xr-x    1 root     root          1260 Feb 14 14:44 iso
drwxr-xr-x    1 root     root          2380 Aug 31  2018 kolla
drwxr-xr-x    1 root     root          1680 Oct 18 13:07 manjaro
drwxr-xr-x    1 root     root           280 Mar 21 14:24 manjaro1
drwxr-xr-x    1 root     root          3360 Dec 11 15:57 openstack-controller
```
