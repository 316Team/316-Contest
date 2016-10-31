- 逆序排序字符串：

```
a='12345'
print a[::-1]
```
***

- 提取字典的 key 值：

```
d2 = {'spam': 2, 'ham': 1, 'eggs': 3}
print d2.keys()
```
***

- 提取 list 嵌套 字典 中字典的指定 value：


```
a=[i.get('1') for i in [{'1':'kill','2':'cent'},{'1':'fan','2':'wan'}] if i.get('1')]
print a
```

- 提取 list 嵌套 字典 中 list 中指定 字典的 key 值和 value 值：

```
a=[{'1':'kill','2':'fan'},{'1':'jj','2':'wan'}]
b=[(x,y) for dic in a for x,y in dic.items() if x=='1']
print(b)
```

- 获取 list 中元素的个数：

```
print len(list)
```

- 将两个 list 合并为一个 dict：

```
a=[eth0,eth1]
b=['192.168.1.1','192.168.2.1']
dict(zip(a,b))
```