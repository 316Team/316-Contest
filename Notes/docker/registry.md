# 搭建远程私有Docker仓库(加密)


- Installing Package for Added Security

```bash
$sudo apt-get install -y apache2-utils
```

- Installing and Configuring the Docker Registry

```bash
$mkdir ~/docker-registry && cd $_
$mkdir data
$sudo vim docker-compose.yml
```

<font color=#FF00FF size=6>docker-compose.yml</font>

```shell
registry:
  image: registry:2
  ports:
    - 127.0.0.1:5000:5000
  environment:
    REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
  volumes:
    - ./data:/data
nginx:
  image: "nginx:1.9"
  ports:
  # - 5043:443
    - 443:443
  links:
    - registry:registry
  volumes:
    - ./nginx/:/etc/nginx/conf.d:ro
```

- Setting Up an Nginx Container

```bash
$sudo mkdir ~/docker-registry/nginx
$sudo vim ~/docker-registry/nginx/registry.conf
```

<font color=#FF00FF size=6>registry.conf</font>

```shell
upstream docker-registry {
  server registry:5000;
}

server {
  listen 443;
  server_name myregistrydomain.com;

 # SSL
  ssl on;
  ssl_certificate /etc/nginx/conf.d/domain.crt;
  ssl_certificate_key /etc/nginx/conf.d/domain.key;

  # disable any limits to avoid HTTP 413 for large image uploads
  client_max_body_size 0;

  # required to avoid HTTP 411: see Issue #1486 (https://github.com/docker/docker/issues/1486)
  chunked_transfer_encoding on;

  location /v2/ {
    # Do not allow connections from docker 1.5 and earlier
    # docker pre-1.6.0 did not properly set the user agent on ping, catch "Go *" user agents
    if ($http_user_agent ~ "^(docker\/1\.(3|4|5(?!\.[0-9]-dev))|Go ).*$" ) {
      return 404;
    }

    # To add basic authentication to v2 use auth_basic setting plus add_header
    auth_basic "registry.localhost";
    auth_basic_user_file /etc/nginx/conf.d/registry.password;
    add_header 'Docker-Distribution-Api-Version' 'registry/2.0' always;

    proxy_pass                          http://docker-registry;
    proxy_set_header  Host              $http_host;   # required for docker client's sake
    proxy_set_header  X-Real-IP         $remote_addr; # pass on real client's IP
    proxy_set_header  X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header  X-Forwarded-Proto $scheme;
    proxy_read_timeout                  900;
  }
}
```

- Setting Up Authentication

创建一个用户，密码中不可以包含`@`符号

```bash
$cd ~/docker-registry/nginx
$htpasswd -c registry.password USERNAME
```

- Setting Up SSL

```bash
$cd ~/docker-registry/nginx
$sudo openssl genrsa -out devdockerCA.key 2048
$sudo openssl req -x509 -new -nodes -key devdockerCA.key -days 10000 -out devdockerCA.crt
$sudo openssl genrsa -out domain.key 2048
$sudo openssl req -new -key domain.key -out dev-docker-registry.com.csr
```

> 出现下面这些，只需要填写一下域名就可以：<br>
> Country Name (2 letter code) [AU]:<br>
> State or Province Name (full name) [Some-State]:<br>
> Locality Name (eg, city) []:<br>
> Organization Name (eg, company) [Internet Widgits Pty Ltd]:<br>
> Organizational Unit Name (eg, section) []:<br>
> Common Name (e.g. server FQDN or YOUR name) []:<font color=red>www.ilovedocker.com</font><br>
> Email Address []:<br>
>
> Please enter the following 'extra' attributes<br>
> to be sent with your certificate request<br>
> A challenge password []:<br>
> An optional company name []:<br>
> 尤其注意不要填写 <font color=red>A challenge password</font>

```bash
$sudo openssl x509 -req -in dev-docker-registry.com.csr -CA devdockerCA.crt -CAkey devdockerCA.key -CAcreateserial -out domain.crt -days 10000
$sudo mkdir /usr/local/share/ca-certificates/docker-dev-cert
$sudo cp devdockerCA.crt /usr/local/share/ca-certificates/docker-dev-cert
$sudo update-ca-certificates
$sudo service docker restart
```

- Testing SSL

```bash
$cd ~/docker-registry
$sudo docker-compose up
$sudo curl https://USERNAME:PASSWORD@[YOUR-DOMAIN]/v2/
```

此处需要注意返回，其返回为{}。如果返回错误或没有返回，则需要重复SSL的步骤<br>
如果测试的时候出现 301 Moved Permanently 可以不用理会，不会影响仓库的运行

- Starting Docker Registry as a Service

```bash
$cd ~/docker-registry
$sudo docker rm -f `sudo docker ps -aq`
$sudo mv ~/docker-registry /docker-registry
$sudo chown -R root: /docker-registry
$sudo vim /etc/init/docker-registry.conf
```

<font color=#FF00FF size=6>docker-registry.conf</font>

```shell
# /etc/init/docker-registry.conf
# 主要是将docker-registry 加入到开机启动


description "Docker Registry"

start on runlevel [2345]
stop on runlevel [016]

respawn
respawn limit 10 5

chdir /docker-registry

exec /usr/local/bin/docker-compose up
```

```bash
$sudo service docker-registry start
$sudo docker ps -a
$sudo tail -f /var/log/upstart/docker-registry.log
$sudo curl https://<YOUR_USERNAME>:<YOUR_PASSWORD>@[YOUR-DOMAIN]/v2/
```

- Accessing Your Docker Registry from a Client

```bash
$sudo cat /docker-registry/nginx/devdockerCA.crt                                // 在远程仓库将显示出来的证书拷贝
		####以下内容都在测试机上进行####
$sudo mkdir /usr/local/share/ca-certificates/docker-dev-cert                    // 在测试机上进行操作
$sudo vim /usr/local/share/ca-certificates/docker-dev-cert/devdockerCA.crt      // 将拷贝的证书粘贴进去
$cat /usr/local/share/ca-certificates/docker-dev-cert/devdockerCA.crt           // 查看一下证书
$sudo vim /etc/default/docker
#添加内容        DOCKER_OPTS="--registry-mirror=https://YOURDOMAIN"
$sudo vim /etc/hosts
#添加内容        YOUR_REGISTRY_HOST_IP       YOUR_REGISTRY_DOMAIN
$sudo update-ca-certificates                                                    // 更新证书
$sudo service docker restart
$sudo docker login https://YOUR_REGISTRY_DOMAIN
$sudo docker tag test-image [YOUR_REGISTRY_DOMAIN]/test-image
$sudo docker push [YOUR_REGISTRY_DOMAIN]/test-image
```

- Pull from Your Docker Registry

```bash
$sudo docker login https://[YOUR_REGISTRY_DOMAIN]
$sudo docker pull [YOUR_REGISTRY_DOMAIN]/test-image
```

- 如果想要使 registry 仓库可以被远程连接，只要在registry 仓库上添加：

```shell
$sudo vim /etc/default/docker
DOCKER_OPTS="$DOCKER_OPTS --insecure-registry=registry_ip:5000"
DOCKER_OPTS="-H 0.0.0.0:2376 -H unix:///var/run/docker.sock"
```

<font size=5>原文出处为：[https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04)</font>

# 搭建 registry 仓库

- 上传镜像

在上传镜像时可能会出现的问题

```shell
The push refers to a repository [172.16.2.29:5000/mongo]
Get https://172.16.33.29:5000/v1/_ping: dial tcp 172.16.33.29:5000: getsockopt: connection refused
和
The push refers to a repository [172.16.2.29:5000/mongo]
Get https://172.16.33.29:5000/v1/_ping: http: server gave HTTP response to HTTPS client
```

出现上面的问题时，主要是因为 Docker 官方是不推荐使用这样的不安全的做法<br>
所以可以在 /etc/default/docker 中添加 Insecure registry

```bash
$sudo vim /etc/default/docker
DOCKER_OPTS="--insecure-registry=172.16.33.29:5000"
```

## 删除 registry 下的镜像
1. 首先停止`registry`服务

    ```bash
    $ sudo service docker-registry stop
    ```

    然后配置`config.yml`中启用删除镜像功能：

    ```shell
    delete:
    	enabled: true
    ```

    并修改`rootdirectory`为`data` ，完整`config.yml`如下：

    ```shell
    version: 0.1
    log:
        fields:
            service: registry
    storage:
        cache:
            blobdescriptor: inmemory
        filesystem:
            rootdirectory: /data
        delete:
            enabled: true
    http:
        addr: :5000
        headers:
            X-Content-Type-Options: [nosniff]
    health:
        storagedriver:
            enabled: true
            interval: 10s
            threshold: 3
    ```

2. 在`docker-compose.yml`中添加`- ./config.yml:/etc/docker/registry/config.yml`文件挂载

    完整`docker-compose.yml`如下：

    ```shell
    version: '2'
    services:
      registry:
        image: registry:2
        ports:
          - 127.0.0.1:5000:5000
        environment:
          REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY: /data
        volumes:
          - ./data:/data
          - ./config.yml:/etc/docker/registry/config.yml
      nginx:
        image: "nginx:1.9"
        ports:
        # - 5043:443
          - 443:443
        links:
          - registry:registry
        volumes:
          - ./nginx/:/etc/nginx/conf.d:ro
    ```

3. 配置完成后启动`registry`服务。

    ```bash
    $ sudo service docker-registry start
    ```

4. 使用`API GET /v2/<镜像名>/manifests/<tag>`来取得要删除的`镜像:Tag`所对应的`digest`。

    Registry`2.3`以后，必须加入头`Accept: application/vnd.docker.distribution.manifest.v2+json`，否则取到的`digest`是错误的，这是为了防止误删除。

    完整的命令是：

    ```bash
    $ sudo curl --header "Accept: application/vnd.docker.distribution.manifest.v2+json" \
    -I -X HEAD -k https://NAME:PASSWD@www.example.com/v2/IMAGE_NAME/manifests/latest \ 
    | grep Docker-Content-Digest
    Docker-Content-Digest: sha256:9a158aca562b4c1cdcb40834456b6422b630b22daf32680dcf63419f1dcf548c
    或者使用这种方法，建议使用下面的方法：
    $ sudo curl -v --silent -H \
    "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET -k https://cimer:cimer@www.cimer.com/v2/gv32_20170327/manifests/latest 2>&1 \
    | grep Docker-Content-Digest | awk '{print $3}'
    sha256:9a158aca562b4c1cdcb40834456b6422b630b22daf32680dcf63419f1dcf548c
    ```

    然后调用`DELETE /v2/<image_name>/manifests/<digest>`来删除镜像

    ```bash
    $ sudo curl -X DELETE -k https://NAME:PASSWD@www.example.com/v2/IMAGE_NAME/manifests/sha256:9a158aca562b4c1cdcb40834456b6422b630b22daf32680dcf63419f1dcf548c
    ```

    至此，镜像已从 `registry` 中标记删除，外界访问 `pull` 不到了。但是 `registry` 的本地空间并未释放，需要等待垃圾收集才会释放。而垃圾收集不可以在线进行，必须停止 `registry`，然后执行。用下面命令用来垃圾收集：

    ```bash
    $ sudo service docker-registry stop
    $ sudo docker run -it --name gc --rm --volumes-from REGISTRY_CONTAINER_NAME registry:2 garbage-collect /etc/docker/registry/config.yml
    $ sudo rm -rf /docker-registry/data/docker/registry/v2/repositories/IMAGE_NAME
    $ sudo service docker-registry start
    ```

    ​
