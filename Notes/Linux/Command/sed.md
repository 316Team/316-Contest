- 替换文档中的字符串：

```bash
$sed -ri 's/原字符串/替换字符串/g' FILE_NAME  // g 为所有匹配的字符串
```

- 替换文档中的字符串（含有单引号的字符串）：

```bash
$sed -ri "s/who ami 'i';/who ami 'wo';/g"  FILE_NAME
```

- 正则表达式认可的特殊字符：

```bash
. * [] ^ $ {} \ + ? | ()
```

- 替换 `httpd.conf` 中的 `CustomLog` 后的任何参数为 `/proc/self/fd/1` ，原字符串为 `CustomLog "***kdkdkjflsnc"`

```bash
$sed -ri -e 's!^(\s*CustomLog)\s+\S+!\1 /proc/self/fd/1!g' httpd.conf
```
