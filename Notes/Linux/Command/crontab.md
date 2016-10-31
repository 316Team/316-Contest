> crontab命令被用来提交和管理用户的需要周期性执行的任务，与windows下发的计划任务类似，当安装完成操作系统后，默认会安装此服务工具，并且会自动启动crond进程，crond进程每分钟会定期检查是否有要执行的任务，如果有要执行的任务，则自动执行该任务。

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>语法</font></td><tr></table>

```
#crontab（选项）（参数）
```

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>选项</font></td><tr></table>

```
-e：编辑该用户的计时器设置
-l：列出该用户的计时器设置
-r：删除该用户的计时器设置
-u<用户名称>：指定要设定计时器的用户名称
```

<table><tr><td bgcolor=#000000><font color=#FFFFFF size=6>参数</font></td><tr></table>

```
crontab文件：指定包含待执行任务的crontab文件
```
