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

### rm

- 删除本地目录

```shell
$ git rm -rf DOCUMENT
```

- 删除远程服务器文件，本地保留

```shell
$ git rm --cached filename/git rm -f --cached directory
$ git commit -m "xxxx"
$ git push
```


### commit

- 修改commit

```shell
$ git commit --amend
$ git push -f
```


### stash

```shell
$ git stash                           // 保存当前工作进度
$ git stash list                      // 显示保存进度的列表
$ git stash pop [-index] [stash_id]   // 恢复最新的进度到工作区
$ git stash apply [-index] [stash_id] // 恢复最新的进度到工作区，且不删除进度
$ git stash drop [stash_id]           // 不指定`stash_id`则删除最新的进度
$ git stash clear                     // 删除所有的进度
```
