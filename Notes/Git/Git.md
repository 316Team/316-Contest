# 查看Git的全局设置信息

```
$git config -l
```

## 多帐号登录

- 取消git全局设置

```
$git config --global --unset user.name
$git config --global --unset user.email
```

- 针对每个项目，单独设置用户名和邮箱

```
$mkdir test
$cd test
$git init
$git config user.name "your_name"
$git config user.email "your_email"
```

- SSH 配置

```
$cd ~/.ssh
$ssh-keygen -t rsa -C "your_email"
# 设置名称为id_rsa_work
Enter file in which to save the key (/c/User/Administrator/.ssh/id_rsa)：id_rsa_work
# 将id_rsa_work 添加到 SSH agent中
$ssh-add ~/.ssh/id_rsa_work
# 如果出现 Could not open a connection to your authentication agent 的错误，使用以下命令
$ssh-agent absh
$ssh-add ~/.ssh/id_rsa_work
# 创建 config 文件
$touch config
# 配置文件
Host github.com
HostName github.com
# 域名或者IP地址
User git
IdentityFile C:/Users/Administrator/.ssh/id_rsa_work
```