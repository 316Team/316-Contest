- 删除开头带有横杠的文件，如：-file_name(文件名)

```shell
$ rm -rf -- -file_name
```

- 删除带有其他特殊字符的文件：

```shell
$ rm -rf \特殊字符
$ rm -rf \\
$ rm -rf \>
$ rm -rf "特殊字符"
$ rm -rf "*"
$ rm -rf '\'
```
