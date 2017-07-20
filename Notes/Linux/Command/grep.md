- 同时搜索两个字符串

```bash
$ grep -E "aaa|bbb"
```

> `-i`不区分文件内容的大小写

- 打印除某字符外的字符串

```bash
$ grep -Pv `(img|qcow2)$` FILE_NAME
```

- 查找目录下的所有文件中是否含有某个字符串,并且只打印出文件名

```bash
$ find . | xargs grep -ri "WORD" -l
```

- 打印除空行和注释行的有效配置

```bash
$ grep -Pv "^$|#" FILE_NAME
```
