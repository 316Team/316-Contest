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

> - 如果出现`Could not open a connection to your authentication agent`的错误，使用以下命令
>
> ```shell
> $ ssh-agent bash
> $ ssh-add ~/.ssh/id_rsa_work
> ```
> 如果还是提示该错误，则需要先排查错误
> ```shell
> $ ssh -vT git@github.com
> sign_and_send_pubkey: signing failed: agent refused operation
> debug1: Offering public key: RSA SHA256:n0J4bt7doqpwCJt10/h7jwXKRqwO1H8LKCsDw1I5bfg /home/xxx/.ssh/id_rsa_work
> debug1: Authentications that can continue: publickey
> debug1: Offering public key: RSA SHA256:l8YripmLhJminF218wfL1QOkdyERuhC78qIpfNfi5rA /home/xxx/.ssh/id_rsa
> debug1: Authentications that can continue: publickey
> debug1: Offering public key: RSA SHA256:aMh9XcgvUpWmtM0W2x4avdxKlseF2YeXPKracE1eVVI xxx@xxx.com
> debug1: Authentications that can continue: publickey
> debug1: Offering public key: RSA SHA256:kHSHVGpFvRhaWfnU63DJDNS1DbHz/dPsodAfij2Awq0 xxx@xxx.com
> debug1: Authentications that can continue: publickey
> debug1: No more authentication methods to try.
> // 出现此情况可以尝试修改`ssh`目录的权限
>
> $ chmod 0700 ~/.ssh
> $ chmod 0600 ~/.ssh/id_rsa*
> ```
>
> 或者可以删除`key`重新添加
>
> ```shell
> $ ssh-add -D
> $ rm -r ~/.ssh
> ```
