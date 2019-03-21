# Docker 安装

[TOC]

## 1. ubuntu版本的安装

### 1.1 首先，检查一下系统的内核版本：

```bash
$sudo uname -r
```

​	内核版本要大于`3.10`

### 1.2 升级系统

```bash
$sudo apt-get update
$sudo apt-get install apt-transport-https ca-certificates
```

### 1.3 添加新的GPG key

```bash
$sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
$sudo vim /etc/apt/source.list.d/docker.list
```

### 1.4 根据对应版本，添加仓库源

​	`12.04`

```bash
deb https://apt.dockerproject.opeizhi
```

​	`14.04`

```bash
deb https://apt.dockerproject.org/repo ubuntu-trusty main
```

​	`16.04`

```bash
deb https://apt.dockerproject.org/repo ubuntu-xenial main
```

### 1.5 更新系统

```bash
$sudo apt-get update
```

### 1.6 清除老的repo

```bash
$sudo apt-get purge lxc-docker
```

### 1.7 检查缓存

```bash
$sudo apt-cache policy docker-engine
```

### 1.8 更新系统

```bash
$sudo apt-get update
```

### 1.9 安装推荐包

```bash
$sudo apt-get install linux-image-extra-$(uname -r)
```

### 1.10更新系统

```bash
$sudo apt-get update
```

### 1.11 安装Docker

```bash
$sudo apt-get install docker-engine
```

### 1.12 开启Docker服务

```bash
$sudo service docker start
```

### 1.13 验证安装

```bash
$sudo docker run hello-world
```

### 1.14 创建Docker用户组

```bash
$sudo groupadd docker
```

### 1.15 追加用户到Docker用户组

```bash
$sudo usermod -aG docker ubuntu
```

## 2. CentOS版本的安装

- 同`Ubuntu`版本一样，先检查内核版本，且必须要大于`3.10`

```bash
$uname -r
```

- 更新系统

```bash
$sudo yum update
```

- 添加`yum repo`

```bash
$sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enable=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
```

- 安装`Docker`

```bash
$sudo yum install docker-engine
```

- 启用服务

```bash
$sudo systemctl enable docker.service
```

- 开启`Docker`守护进程

```bash
$sudo systemctl start docker
```

*********************

### 使用安装脚本

- 更新系统

```bash
$sudo yum update
```

- 运行`Docker`安装脚本

```bash
$curl -fsSL https://get.docker.com/ | sh
```

- 启用服务

```bash
$sudo systemctl enable docker.service
```
- 开启`Docker`守护进程

```bash
$sudo systemctl start docker
```

*********************

- 创建`Docker`用户组

```bash
$sudo groupadd docker
```

- 添加你用户到`Docker`用户组

```bash
sudo usermod -aG docker YOUR_USER_NAME
```

- 配置`Docker`守护进程开机启动

```bash
$sudo systemctl enable docker
```

*********************

### 卸载Docker

- 查看安装`Docker`的安装包列表

```bash
$yum list installed | grep docker

docker-engine.x86_64                   1.12.3-1.el7.centos             @dockerrepo
docker-engine-selinux.noarch           1.12.3-1.el7.centos             @dockerrepo
```

- 移除安装包

```bash
$sudo yum -y remove docker-engine.x86_64
$sudo yum -y remove docker-engine-selinux.noarch
```

该命令并不会移除在主机上的镜像、容器、卷和用户创建的配置文件

- 删除所有的镜像、容器和卷

```bash
$sudo rm -rf /var/lib/docker
```

- 找到并删除用户所创建的关于`Docker`的配置文件

*********************

详情请看Docker [官方文档](https://docs.docker.com/engine/installation/linux/ubuntulinux/)

# docker-compose

- Install docker-compose

```bash
$curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$chmod +x /usr/local/bin/docker-compose
$docker-compose --version
docker-compose version: 1.8.0
```

如需最新版本详见 [版本地址](https://github.com/docker/compose/releases)

```bash
$sudo pip install docker-compose
```
