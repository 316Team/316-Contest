如果在启动 Ipython 的时候出现如下错误：

![](http://172.16.4.111:8000/bianl/Basic_Virtual/raw/dev/huful/image/Ipython.png)<br>
极大的可能是因为当前目录不是用户目录，只要进入/home/username 目录就能正常启动 Ipython 了

## 命令行下输入 Ipython 进入 Ipython 下

```
$sudo Ipython
In [1]:from docker import Client
In [2]:c = Client(base_url='unix://var/run/docker.sock')
In [3]:c.
```

## Tab 补全，可以显示出子命令

- 显示container的详细信息

```
In [4]:c.containers（）
```

- 查询容器名

```
In [5]:c.inspect_container('container_id')['Name']
```

- 将容器打包成镜像

```
In [6]:c.commit('container_id', repository='REPOSITORY', tag='name')
```

- 移除镜像

```
In [7]:c.remove_images('image_id')
```

- Ipython 中查看命令的帮助信息

```
In [1]:help(command)
```

- 在命令后面加上问号，可以显示该命令的详细信息

```
In [1]:c.images?
Signature: c.images(name=None, quiet=False, all=False, viz=False, filters=None)
Docstring: <no docstring>
File:      /usr/local/lib/python2.7/dist-packages/docker/api/image.py
Type:      instancemethod
```