> md 是 markdown 的缩写，markdown 是一种编辑博客的语言。
添加图片的格式如下：![ alt ]( img_url )

`![ alt ]( img_url )`

> 如果是在git上创建一个存放图片的文件夹，格式可以这样写：![ alt ]( http://git地址/bianl/Basic_Virtual/raw/dev/huful/image/name.png)

`![ alt ]( http://git地址/bianl/Basic_Virtual/raw/dev/huful/image/name.png)`

> 添加本地图片  ：![alt](file:///E:len/Basic_Virtual/huful/image/XenServer_Disconnected.png)

`![alt](file:///E:len/Basic_Virtual/huful/image/XenServer_Disconnected.png)`

> 在最前面带有点标记的，在前面加上小短杠和空格
- 标记

`- 标记`

> 贴代码

```
代码
```

- 上标下标

`文字<sup>上标内容</sup>`

H<sup>222<sup/>

`文字<sub>下标内容</sub>`

H<sub>222</sub>

# 一级标题

`# 在文字前方加上井号，则该行文字则为一级标题`

> 为文字添加背景色：<table><tr><td bgcolor=#FFFFFF>文字内容</td></tr></table>

`<table><tr><td bgcolor=#FFFFFF>文字内容</td></tr></table>`

> 为文字设置颜色、字体和大小：<font face="字体" size=6 color=#F0F0F00>文字内容</font>

`<font face="字体" size=6 color=#F0F0F00>文字内容</font>`

> 添加文字链接：[文字内容](链接地址)

`[文字内容](链接地址)`

> 添加换行符

`文字内容<br>`

# 段落缩进：
首行使用`tab`键，余下的段落可以使用缩进

> 插入复选框： `- [ ] C` `- [x] C`

- [ ] C
- [x] C

> 插入表格

| Host_name   | Host_passwd  |
| :---------:               | :----------: |
| 172.16.2.157              | yf:zm123     |
| 172.16.4.201              | redhat       |
| 82.82.82.3                | r00tme       |
| source Floor-openrc.sh    | admin        |

- | Host_name   | Host_passwd  | <br>
| :---------:               | :----------: | <br>
| 172.16.2.157              | yf:zm123     | <br>
| 172.16.4.201              | redhat       | <br>
| 82.82.82.3                | r00tme       | <br>
| source Floor-openrc.sh    | admin        | <br>

