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

- 排除文件或目录

> 如果文件或目录较多，可以以文件的形式<CR>
> 创建需排除的目录和文件的文件<CR>
> 列表如下<CR>
```
$cat excluded
/dev/*
/proc/*
/sys/*
/tmp/*
/media/*
```
> 然后运行命令`$sudo rsync -aAXhv --exclude-from=excluded / /mnt/backup`

> 也可以直接从命令行排除文件或目录`$sudo rsync -aAXhv --exclude={"/var/cache","/var/tmp"} /var /home/adrian/var`
