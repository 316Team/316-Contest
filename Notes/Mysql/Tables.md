- 创建数据表

```
mysql>create table tables_name (<字段名1><类型名1>);
mysql>  CREATE TABLE taula (time int(13),username varchar(20),tweet varchar(140));
```

- 查询数据表的字段信息

```
mysql>DESCRIBE tables_name;
mysql>DESCRIBE taula;
```

- 插入数据

```
mysql>INSERT INTO tables_name VALUES( 内容 );
mysql>INSERT INTO taula VALUES (1385419969,"sentdex","welcome to my tutorial");
```

导入 sql 文件：

- 首先创建好一个数据库

```
mysql>create database database_name;
```

- 导入文件

```
mysql>source FILE_PATH/name.sql
```

- 导出 数据库：

```
$sudo mysqldump -uUSER_NAME -pUSER_PASSWD DATABASE_NAME > FILE_NAME.sql
```

- 清空数据表中的数据：

```
mysql>truncate table table_name;
```

- 更新数据表中的字段 value：

```
mysql>update TABLE_NAME set id=1 where uuid=666;
# 更新 TABLE_NAME 数据表中的 id=1 的 uuid 字段的 value 值为 666
```

- 给root用户权限

```
mysql>grant all privileges on *.* to 'root'@'%' identified by 'Password';
```
