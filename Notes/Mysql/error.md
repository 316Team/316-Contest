2016-07-08：

![](https://github.com/316Team/316-Contest/blob/316Team/image/Mysql-error-1.png)

当有多个timestamp时，会导致default问题：

![](https://github.com/316Team/316-Contest/blob/316Team/image/Mysql-error-2.png)

只要将其改为：

```
  `batch_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '批次创建时间',
  `batch_start_time` timestamp  COMMENT '批次开始时间',
  `batch_finish_time` timestamp  COMMENT '批次结束时间',
```

2016-07-27:

> 问题：在Win 7 上安装 Mysql 5.7.13，安装完成后，不能够启动mysql服务。

# 解决方法：

```
首先将data 文件夹清空，然后
>mysqld --initialize-insecure --user=mysql      #初始化mysql
>mysqld -install
>net start mysql
```
