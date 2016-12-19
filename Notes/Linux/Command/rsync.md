- scp 断点续传

`$rsync -P --rsh=ssh home.tar 192.168.0.34:/home/home.tar`

- 本地文件夹同步

```
$rsync -auvrtzopgP --progress /root/ /tmp/root_back/
// 删除root 下的文件不会同步删除/tmp/root_back/，除非加入 `--delete` 选项
```

- 增量同步

```
$rsync -P --append FILE1 FILE2
```
