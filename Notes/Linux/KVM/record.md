# KVM 使用记录

> KVM 创建qcow2镜像：<br>
> CentOS 命令行版本 实现 root 自动登录<br>
> vi /etc/systemd/system/getty.target.wants/getty\@tty1.service<br>
> 找到 ExecStart项<br>
> 添加 --autologin root即可。

- 将img镜像转化为qcow2格式的镜像

`$qemu-img convert -f raw -O qcow2 SOURCE_IMAGE.img DESTINATION_IMAGE.qcow2`

- 检查cpu是否支持kvm虚拟化,得到返回1或者vmx则支持，返回0或无返回则不支持

`$egrep -o '(vmx|svm)' /proc/cpuinfo`
