更新 mysql 版本：

- 从官方获取 Mysql 的 APT 仓库：

```
wget http://repo.mysql.com//mysql-apt-config_0.6.0-1_all.deb
```

- 选择更新版本

```
dpkg -i mysql-apt-config_0.6.0-1_all.deb
```

- 更新系统

```
sudo apt-get update
```

- 安装 mysql

```
sudo apt-get install mysql-server
```