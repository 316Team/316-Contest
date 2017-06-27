# Git 使用经验

[TOC]

### tag

- 创建带有说明的标签，并指定`commit id`，用`-a`指定标签名，`-m`指定文字说明

```shell
$ git tag -a v1.0 -m "version 1.0 released" 3628164
```

- 本地删除标签

```shell
$ git tag -d v1.0
```

- 将标签推送到远程

```shell
$ git push -u origin v1.0
```
