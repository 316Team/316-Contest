# Docker 安装

- ubuntu版本的安装
首先，检查一下系统的内核版本：

```
$sudo uname -r
```

内核版本要大于3.10

- 升级系统

```
$sudo apt-get update
$sudo apt-get install apt-transport-https ca-certificates
```

- 添加新的GPG key

```
$sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
$sudo vim /etc/apt/source.list.d/docker.list
```

- 12.04

```
deb https://apt.dockerproject.org/repo ubuntu-precise main
```

- 14.04

```
deb https://apt.dockerproject.org/repo ubuntu-trusty main
```

- 更新系统

```
$sudo apt-get update
```

- 清除老的repo

```
$sudo apt-get purge lxc-docker
```

- 检查apt

```
$sudo apt-cache policy docker-engine
```

- 更新系统

```
$sudo apt-get update
```

- 安装推荐包

```
$sudo apt-get install linux-image-extra-$(uname -r)
```

- 更新系统

```
$sudo apt-get update
```

- 安装Docker

```
$sudo apt-get install docker-engine
```

- 开启Docker服务

```
$sudo service docker start
```

- 验证安装

```
$sudo docker run hello-world
```

- 创建Docker 用户组

```
$sudo groupadd docker
```

- 追加用户到Docker 用户组

```
$sudo usermod -aG docker ubuntu
```

详情请看Docker [官方文档](https://docs.docker.com/engine/installation/linux/ubuntulinux/)

# docker-compose

- Install docker-compose

```
$curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$chmod +x /usr/local/bin/docker-compose
$docker-compose --version
docker-compose version: 1.8.0
```

```
$sudo pip install docker-compose
```