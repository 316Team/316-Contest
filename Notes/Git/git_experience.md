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

### git log

> git log 个性化输出

```shell
$ git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
*   e2f00b7 2017-08-16 | Merge branch 'dev' of ******:zhangsantjl/HoneyPot into dev [zhangsantjl]
|\
| * 051a30c 2017-07-24 | 修改了elk [zhangsan]
* | 3050af7 2017-08-16 | add image_name in elkloop search result, and insert into database [zhangsantjl]
|/
* 0b30a77 2017-05-18 | 修复ping接口bug [zhangsan]
*   f10744d 2017-05-15 | nthe Merge branch 'dev' of https://******/zhangsantjl/HoneyPot into dev ai... [zhangsan]
|\
| *   90ddb91 2017-05-12 | Merge branch 'fix' into dev [lisi]
| |\
| | * e826d50 2017-05-12 | add three api for restfulAPI.py [lisi]
| |/
* | 35eec96 2017-05-15 | 获取镜像函数 [zhangsan]
$ git log --reverse --no-merges --format=format:'* %s (%h)*#%b' --since="2018-01-19 00:00:00" --until="$(date +%F) 23:59:59"
$ git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
$ git log --since=2018-03-01 --until=2018-12-27 --author="胡福亮" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }'
$ git log --author="$(git config --get user.name)" --pretty=tformat: --numstat | gawk '{ add += $1 ; subs += $2 ; loc += $1 - $2 } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
$ git log --shortstat --pretty="%cE" | sed 's/\(.*\)@.*/\1/' | grep -v "^$" | awk 'BEGIN { line=""; } !/^ / { if (line=="" || !match(line, $0)) {line = $0 "," line }} /^ / { print line " # " $0; line=""}' | sort | sed -E 's/# //;s/ files? changed,//;s/([0-9]+) ([0-9]+ deletion)/\1 0 insertions\(+\), \2/;s/\(\+\)$/\(\+\), 0 deletions\(-\)/;s/insertions?\(\+\), //;s/ deletions?\(-\)//' | awk 'BEGIN {name=""; files=0; insertions=0; deletions=0;} {if ($1 != name && name != "") { print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net"; files=0; insertions=0; deletions=0; name=$1; } name=$1; files+=$2; insertions+=$3; deletions+=$4} END {print name ": " files " files changed, " insertions " insertions(+), " deletions " deletions(-), " insertions-deletions " net";}'
```
