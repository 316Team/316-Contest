# Dockerfile 写法中的注意事项

- CMD 和 ENTRYPOINT

```
CMD foo a b c
```

```
CMD ["foo", "a", "b", "c"]
```

> 尽量选择第二种写法

### 挑选合适的基础镜像

> 基础镜像尽量选最小的镜像，使用的时候一定要指定有版本号的镜像。如果有多个镜像需要安装相同的软件，那可以考虑新建一个基础镜像来安装这些软件。然后再使用这个镜像生成其他的镜像。

### 优化 apt-get 相关操作

> 将多个 apt-get 操作合并成一个，在 apt-get install 之前，先 apt-get update ,安装完成后最好使用 apt-get clean 清理一下。在使用 apt-get install 安装软件时，最好是按照字母排列，这样方便查找。

### 合理使用 ADD 命令

> 1、ADD 命令和 COPY 命令在很大程度上功能是一样的，但是 COPY 语义更加直接。但是唯一例外的是 ADD 命令自带解压功能，如果需要拷贝并解压一个文件到镜像中，我们可以使用 ADD 命令，除此之外，推荐使用 COPY。<br>
> 2、如果是使用 ADD 命令来获取网络资源，是不推荐的。网络资源应该使用 RUN wget 或者 curl 命令来获取。

### 移除构建依赖

> 当 apt-get update 结束后，可以将更新的缓存给删掉。同理，安装并使用完的包也可以卸载

```
RUN apt-get update && apt-get install -y wget zip --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove wget zip
```

