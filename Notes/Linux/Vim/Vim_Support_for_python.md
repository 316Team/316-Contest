# Ubuntu 16.04 下 Vim 7.4 支持 Python 2.7

## 0x1
- 首先在终查看vim是否支持python，`$vim --version | grep Python` 如果出现 `+python`，则支持 python，如果是 `-python`，则需要安装 python 支持

## 0x2
- 安装 `vim-nox-py2`

```bash
$sudo apt-get install vim-nox-py2
```
- 如果还是没有 `+python`则需要手动切换

```bash
$sudo update-alternatives --config vim
```

然后按照提示，选择 `编号 /usr/bin/vim.nox-py2 优先级 手动模式` 就可以了，然后再查看一下vim的版本
