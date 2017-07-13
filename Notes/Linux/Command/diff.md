- 对比两个目录

```shell
$ diff -c -a -b -x .git A B > AB.diff
```

- 对比两个目录及目录下的文件

```shell
$ diff -ruNa -x .git A B > AB.diff
```
