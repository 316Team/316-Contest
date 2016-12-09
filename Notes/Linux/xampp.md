# 将 xampp 加入到开机自启中

- 方法一

```bash
$sudo vim /etc/init.d/lampp.sh
    #!/bin/sh
    /opt/lampp/lampp start
$sudo chmod 755 /etc/init.d/lampp.sh
$sudo vim /etc/init.d/rc.local
末尾添加
    sh /etc/init.d/lampp.sh
or
    exec /etc/init.d/lampp.sh
$sudo reboot
```

- 方法二

```bash
$sudo ln -s /opt/lampp/lampp /etc/init.d/lampp
$sudo update-rc.d -f lampp defaults
```
