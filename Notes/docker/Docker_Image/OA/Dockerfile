# 存在git 泄漏，中危漏洞
# 存在弱口令，低危漏洞
# .DS_store 泄漏，低危漏洞

FROM debian:jessie

COPY xampp-linux-x64-5.6.23-0-installer.run /opt/xampp-linux-x64-5.6.23-0-installer.run

COPY ranzhi /opt/lampp/htdocs/ranzhi

# 对于以 debian:jessie 为基础的镜像下使用 xampp 必须安装 net-tools #

RUN apt-get update && apt-get install net-tools \
    && rm -rf /var/lib/apt/lists/* \
    && chmod u+x /opt/xampp-linux-x64-5.6.23-0-installer.run \
    && bash -c '/opt/xampp-linux-x64-5.6.23-0-installer.run' \
    && echo '#!/bin/bash\n/opt/lampp/lampp start\nwhile true;do sleep 1000;done' > /opt/lampp/run.sh \
    && chmod u+x /opt/lampp/run.sh \
    && rm -rf /opt/xampp-linux-x64-5.6.23-0-installer.run

ADD 22.tar /opt/lampp/htdocs/ranzhi/oa/

COPY httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf

# 日志文件位置 '/opt/lampp/logs/','/var/log/' #

WORKDIR /root/

EXPOSE 80 3306

CMD ["/opt/lampp/run.sh"]

# payload:
#   oa: /ranzhi/www/sys/misc-ping-.html
#       /ranzhi/www/sys/entry-printBlock-1.html
#       /ranzhi/oa/22/.git/config
#       /ranzhi/oa/22/.git
#       /ranzhi/oa/22/.DS_Store
#   oa: USER_NAME : admin
#       PASSWORD : 123456
# oa 的访问地址：HOST_IP:PORT/ranzhi/www/