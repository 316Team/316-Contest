> usermod 用来修改用户的基本信息。usermod命令不允许你改变正在线上的使用者账号名称。当usermod命令用来改变 user id，必须要确认这个用户没有执行任何操作。你需要手动更改使用这的[crontab](http://172.16.4.111:8000/bianl/Basic_Virtual/blob/dev/huful/Notes/Linux/Command/crontab.md)档。也需手动更改使用者的[at](http://172.16.4.111:8000/bianl/Basic_Virtual/blob/dev/huful/Notes/Linux/Command/at.md)工作档。采用NIS server须在server上更改相关的NIS设定。

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>语法</font></td></tr></table>

```
#usermod（选项）（参数）
```

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>选项</font></td></tr></table>

```
-c<备注>：修改用户账号的备注文字
-d<登入目录>：修改用户登录时的目录
-e<有效期限>：修改账号的有效期限
-f<缓冲天数>：修改在密码过期后多少天即关闭该账号
-g<群组>：修改用户所属的群组
-G<群组>：修改用户所属的附加群组
-l<账号名称>：修改用户账号名称
-L：锁定用户密码，使密码无效
-s<shell>：修改用户登录后所使用的Shell
-u<uid>：修改用户的ID
-U：接触密码锁定
```

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>参数</font></td></tr></table>

```
登录名：指定要修改信息的用户登录名
```

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>实例</font></td></tr></table>

- 将newuser2添加到组staff中

```
#usermod -G staff newuser2
```

- 修改newuser的用户名为newuser1

```
#usermod -l newuser1 newuser
```

- 锁定账号newuser1

```
#usermod -L newuser1
```

- 解除对newuser1的锁定

```
#usermod -U newuser1
```