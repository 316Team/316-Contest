借鉴文档：https://confluence.oceanobservatories.org/display/CIDev/PyCharm+-+PEP8+and+Pyflakes+Integration

Pycharm==>File==>Settings==>Tools==>External Tools

然后点击添加  +  。<br>
Name：PEP8<br>
Program：pep8<br>
Parameters：$FilePath$<br>
Working directory：$ProjectFileDir$<br>
![](https://github.com/316Team/316-Contest/blob/316Team/image/PEP8-1.png)
Output Filters==>添加  + 。<br>
Regular expression to match output：$FILE_PATH$\:$LINE$\:$COLUMN$\:.*
![](https://github.com/316Team/316-Contest/blob/316Team/image/PEP8-2.png)
<br>
如果Pycharm 开启后，一直出现 Updating Indices，点击 file-->invalidate caches/restart-->invalidate and restart<br>

- Pycharm 2016.2 License:

[正版注册码](http://idea.lanyus.com/)
