# Dockerfile 编写指南

- dockerfile 基本格式：

```
# Version: 1.0.1
## Docker 的版本 ##

FROM ubuntu:latest
## 使用的基础镜像 ##

MAINTAINER xxx "xxx@163.com"
## 创建和维护者信息 ##

USER root
## 设置 root 用户为后续命令的执行者 ##

RUN apt-get update
RUN apt-get install -y nginx
## 执行操作 ##

RUN touch test.txt && echo "abc" >> abc.txt
## 使用 && 拼接命令 ##

EXPOSE 80 8080 1038
## 对外暴露端口 ##

ADD abc.txt /opt/
## 添加文件 ##
## 如果这个文件是ZIP或者Tar形式的压缩包，Docker会先解压缩，然后将文件添加到镜像指定的位置 ##

ADD /webapp /opt/webapp
## 添加文件夹 ##

ADD https://www.baidu.com/img/bd_logo1.png /opt/
## 添加网络文件 ##

ENV WEBAPP_PORT=9090
## 设置环境变量 ##

WORKDIR /opt
## 设置工作目录 ##

ENTRYPOINT ["ls"]
## 设置启动命令 ##

CMD ["-a", "-l"]
## 设置启动参数 ##

VOLUME ["/data", "/var/www"]
## 设置卷 ##

ONBUILD ADD . /app/src
ONBUILD RUN echo "on build excuted" >> onbuild.txt
## 设置子镜像的触发操作 ##
```
