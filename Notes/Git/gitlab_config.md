# `gitlab`配置

- `git push`自动关闭`Gitlab`的`Issue`

修改`Gitlab`的配置文件`/etc/gitlab/gitlab.rb`中`gitlab_issue_closing_pattern`通过模式匹配用户的提交日志，如果匹配将自动关闭`Issue`。`9.5.2`版本中只需取消其注释即可。

```shell
gitlab_rails['gitlab_issue_closing_pattern'] = "((?:[Cc]los(?:e[sd]?|ing)|[Ff]ix(?:e[sd]|ing)?|[Rr]esolv(?:e[sd]?|ing))(:?) +(?:(?:issues? +)?%{issue_ref}(?:(?:, *| +and +)?)|([A-Z][A-Z0-9_]+-\d+))+)"
```
