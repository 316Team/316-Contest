# Tmux 的用法

- 安装：

```bash
$sudo apt-get install tmux
```

- 分屏

```
$tmux
    Ctrl+b "    创建横向切割窗口
    Ctrl+b %    创建纵向切割窗口
```

- 删除当前分屏

```
Ctrl+b x
```

- Tmux 下回滚屏幕

```
Ctrl+b [
兼容 vim 的操作方式，在tmux.conf 加上一行：
setw -g mode-keys vi
```
