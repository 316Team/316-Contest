- 安装ansible Python模块

> 如果安装了paramiko，则可以直接安装ansible。否则先安装
[paramik](http://172.16.4.111:8000/bianl/Basic_Virtual/blob/dev/huful/Notes/Python/python-ssh.md)

```
$sudo pip install ansible
```

- Linux 安装ansible

```
$sudo apt-get install ansible
```

> 如果不能够直接安装则：<br>
> 添加apt源

```
$sudo vim /etc/apt/source.list
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
$sudo apt-get install software-properties-common
$sudo apt-add-repository ppa:ansible/ansible
$sudo apt-get update
sudo apt-get install ansible
```

# ansible 的使用

- 添加hosts ip

```
$sudo vim /etc/ansible/hosts
[default]
Cluster_IP
```

- 首先创建主 masteer 与其他每台机器之间的无密码登录

```
$ssh-keygen                         #一路回车
$touch authorized_keys
$cat id_rsa.pub >> authorized_keys
将集群主机内的id_rsa.pub 中的密钥添加进 authorized_keys 中
$ssh Cluster_name@Cluster_IP        #测试是否成功
```

- 在建立SSH 连接时，避免重复输入密码

```
$ssh-agent bash
$ssh-add ~/.ssh/id_rsa
```

- ping 所以Cluster 节点

```
$ansible all -m ping
```

> 若显示失败，则可能是 SSH 无密码登录未成功
