## md 是 markdown 的缩写，markdown 是一种编辑博客的语言

## 标题

- 显示：

# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题

- 语法：

```markdown
# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题
```

## 图片和链接

markdown中，插入链接只需要使用 [百度](http://www.baidu.com) 这样的语法即可

- 语法：

```markdown
[显示文本](链接地址)
```

而插入图片与插入链接是类似的：

![alt](http://ww4.sinaimg.cn/bmiddle/aa397b7fjw1dzplsgpdw5j.jpg)

- 语法：

```markdown
![alt](img_url)
```

如果是在git上创建一个存放图片的文件夹，格式可以这样写：

![ alt ](https://github.com/316Team/316-Contest/raw/316Team/image/success.png)

```markdown
![alt](https://github.com/316Team/316-Contest/raw/316Team/image/success.png)
```



添加本地图片  ：

```markdown
![alt](file:///E:len/Basic_Virtual/huful/image/XenServer_Disconnected.png)
```

## 列表

显示：

- 文本1

- 文本2

- 文本3

语法：

```markdown
- 文本1
- 文本2
- 文本3
```

有序列表如下：

- 显示：

1. 文本1
2. 文本2
3. 文本3

- 语法：

```markdown
1. 文本1
2. 文本2
3. 文本3
```

注：- 和1. 要与文本之间保留一个字符的空格

## 代码引用

在`markdown`中，引用代码块使用两个`符号将代码块包起来就行，如果引用代码段则需要用``符号将代码段包起来

#### 代码块

- 显示：

`echo`

- 语法：

```markdown
`echo`
```

#### 代码段

- 显示：

```shell
#！/bin/bash
echo "Hello World"
echo "This is markdown"
echo "This is code snippet"
```

- 语法：

```markdown
​```shell
#！/bin/bash
echo "Hello World"
echo "This is markdown"
echo "This is code snippet"
​```
```

## 引用

在`markdown`中，引用他人文字，只需在文仔前面加上`>`就好了：

- 显示：

> 岂曰无衣？与子同袍。王于兴师，修我戈矛，与子同仇！
>
> 岂曰无衣？与子同泽。王于兴师，修我矛戟，与子偕作！
>
> 岂曰无衣？与子同裳。王于兴师，修我甲兵，与子偕行

- 语法：

```markdwon
> 岂曰无衣？与子同袍。王于兴师，修我戈矛，与子同仇！
>
> 岂曰无衣？与子同泽。王于兴师，修我矛戟，与子偕作！
>
> 岂曰无衣？与子同裳。王于兴师，修我甲兵，与子偕行
```

## 粗体和斜体

Markdown 的粗体和斜体表示，使用两个`*`包含一段文字就是粗体的语法，用一个`*`包含一段文字就是斜体的语法

- 显示：

岂曰无衣？*与子同袍*。王于兴师，修我戈矛，*与子同仇！*

岂曰无衣？**与子同泽**。王于兴师，修我矛戟，**与子偕作！**

岂曰无衣？*与子同裳*。王于兴师，修我甲兵，**与子偕行**

- 语法：

```markdown
岂曰无衣？*与子同袍*。王于兴师，修我戈矛，*与子同仇！*

岂曰无衣？**与子同泽**。王于兴师，修我矛戟，**与子偕作！**

岂曰无衣？*与子同裳*。王于兴师，修我甲兵，**与子偕行**
```

## 上标下标

- 显示：

H<sup>222<sup/>

- 语法：

```markdown
H<sup>222</sup>
```

- 显示：

H<sub>zzz</sub>

- 语法：

```markdown
H<sub>zzz</sub>
```

## 为文字添加背景色

- 显示：

<table><tr><td bgcolor=#694d9f>文字内容</td></tr></table>

- 语法：

```markdown
<table><tr><td bgcolor=#694d9f>文字内容</td></tr></table>
```

## 为文字设置颜色、字体和大小

- 显示：

<font face="字体" size=6 color=#F0F0F00>文字内容</font>

- 语法：

```markdown
<font face="字体" size=6 color=#F0F0F00>文字内容</font>
```

## 添加换行符

- 显示：

文字内容<br>换行

- 语法：

```markdown
文字内容<br>换行
```



## 段落缩进：
首行使用`tab`键，余下的段落可以自动使用缩进

## 复选框

显示：

- [ ] C

- [x] X

语法：

```markdwon
- [ ] C
- [x] X
```



## 表格

- 显示：

| Tables | name |
| :----: | :--: |
| zbbix  |  监控  |
|  ELK   | 日志查询 |
| python | 脚本语言 |
| shell  | 脚本语言 |

- 语法：

```markdown
| Tables   | name  |
| :---------:               | :----------: |
| zbbix              | 监控     |
| ELK              | 日志查询       |
| python            | 脚本语言       |
| shell    | 脚本语言        |
```
