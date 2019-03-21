# 命令以及使用技巧

- 将镜像打包成 tar 包保存

```
$sudo docker save -o file_name.tar images_name
```

- 将 tar 包 恢复成镜像

```
$sudo docker load -i file_name.tar
```

- 将容器打包成镜像

```
$sudo docker commit CONTIANER_NAME IMAGE_NAME:TAG
```

- 不删除临时缓存

```
$sudo docker build --rm=false IMAGE_NAME:TAG
```

- 将查看容器ip做成脚本

```bash
#!/bin/bash

exec sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
# {{}} 中的是 inspect 查询中一层层的
```

- 删除无标签的镜像

```
$sudo docker rmi $(sudo docker images -q --filter "dangling=true")
```

- 删除所有状态为 Exited 的容器

```
$sudo docker rm $(sudo docker ps -a | grep Exited | awk '{print $1}')
```

- 停止并删除所有的容器

```
$sudo docker rm -f $(sudo docker ps -aq)
```

- 删除指定镜像所创建的容器

```
$sudo docker rm `sudo docker ps -a | grep IMAGE_ID |cut -f1 -d" "`
```

- 删除所有的镜像

```
$sudo docker rmi $(sudo docker images -aq)
```

- 清除无用 volume

```
$sudo docker volume rm `sudo docker volume ls -qf dangling=true`
```

- 查看最近创建的容器日志

```
$sudo docker logs $(sudo docker ps -lq)
```

- 删除临时容器

> 对于临时容器，尽量使用 --rm 选项，在容器退出时自动删除，这样可以节省很多容器维护时间<br>

- 非 root 用户使用 Docker 命令

> 使用 Docker 命令需要 root 权限，如果把当前用户加入 Docker 用户组，就可以直接运行 Docker命令了。通过编辑 /etc/group 文件，直接将用户名写在 docker 那一行后面即可。或者通过 $sudo gpasswd -a MY_USER_NAME docker 命令添加相应用户到 Docker 用户组。完成后，用户需要重新登录使之生效。<br>

- 将容器设为与宿主机同时启动

`sudo docker run -d --restart=always DOCKER_IMAGE`
