#### 语法：split [-<行数>][-b <字节>][-C <字节>][-l <行数>][要切割的文件][输出文件名]

- 指定行数切割文件

```shell
$ split -l 120 log.txt new_log
```

- 指定文件大小切割文件

```shell
$ split -b 2M log.txt new_log
```
