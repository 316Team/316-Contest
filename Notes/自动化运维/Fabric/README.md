- 安装 fabric

```
$sudo pip install fabric
```

- 使用 fabric

```
$fab -f fabfile_path test_command
# 指定 fabfile 路径，执行 test_command 任务
$fab -f test1.py echo

$fab -l
# 列出现有的任务
```