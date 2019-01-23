1. 关闭gitlab服务

```shell
$ sudo gitlab-ctl stop unicorn
$ sudo gitlab-ctl stop sidekiq
```

2. 安装gitlab

```shell
# Ubuntu
$ sudo dpkg -r gitlab
$ sudo dpkg -i giltab-x.x.x-yyy.deb

# CentOS
$ sudo rpm -e gitlab
$ sudo rpm -ivh gitlab-x.x.x-yyy.rpm
```

3. 重新配置 Gitlab

```shell
$ sudo gitlab-ctl reconfigure
```

4. 恢复备份

```shell
$ sudo gitlab-rake gitlab:backup:restore BACKUP=12345 # 12345 在备份的目录，默认目录为 /var/opt/gitlab/backups
```

5. 开启gitlab

```shell
$ sudo gitlab-ctl start
```
