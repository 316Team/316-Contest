# 将每天学到的记录下来，以及OpenStack平台搭建进度和每天的任务

# Github 的使用

```bash
$ssh-keygen -t rsa -C "xxxxxxxxxx@qq.com" // 自己的邮箱地址
// 获取公钥 id_rsa.pub
// 在Github个人设置中将 id_rsa.pub 的内容粘贴到 ssh-key 中
// 创建一个文件夹用来存放远端仓库
$mkdir FOLDER                             // 此文件夹可在任意位置创建，不建议放在 C 盘
$git config --global user.name "your Name"
$git config --global user.email "email@example.com"
$ssh -T git@github.com                    // 登录 github 测试是否配置正确，正确的提示 successful
$git pull orgin 316Team                   // 拉取远程仓库的更新到本地仓库
// 如果 git pull orgin 316Team 拉取不到任何东西，则可以使用克隆到之前所创建的文件夹下
// 进入到创建好的文件夹下
$git clone https://github.com/316Team/316-Contest
$git add *                                // 添加所有文件
$git commit -m "update"                   // 为添加的文件打上 "update" 这个标签
$git push -u orgin 316Team                   // 上传本地仓库到远程仓库
```

- [廖雪峰Git教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

- [高质量Git中文教程](https://github.com/geeeeeeeeek/git-recipes/wiki)
