## 变量名

> 变量名可以是任意长度，包括数字和字母，但是不能以数字开头。根据惯例，变量名只能使用小写字母。<br>
> 下划线 `_` 可以出现在变量名中。多用于分割多个单词组成的变量名，如 `my_name`.

```python
>>> 76file = 'big parade'       //非法变量名，开头不能为数字
SyntaxError: invalid syntax
>>> more@ = 10000               //非法变量吗，包含非法字符@
SyntaxError: invalid syntax
>>> class = 'Advanced Theoetical Zymurgy'   //非法变量名，class是python的关键字(keywords)之一
SyntaxError: invalid syntax
```
