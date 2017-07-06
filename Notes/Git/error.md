> 2016/07/05：
> - push 错了内容，然后回退版本
> ```shell
> $ git reset --hard HEAD^
> ```


> - 如果在执行`ssh -T git@xxx.xx.xx.x`时，显示需要输入密码，如：
>
> ```shell
> $ cimer@cimer:~/docker_jenkins$ ssh -T git@192.168.5.11
> git@192.168.5.11's password: 
> ```
>
> 则有可能是冲突了，需要将秘钥添加，可参考[Git 多账号登录->SSH配置](https://github.com/316Team/316-Contest/blob/316Team/Notes/Git/Git.md)

