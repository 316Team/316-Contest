# phpcms shell

FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget zip mysql-client

COPY xampp-linux-x64-5.6.23-0-installer.run /opt/xampp-linux-x64-5.6.23-0-installer.run

RUN chmod u+x /opt/xampp-linux-x64-5.6.23-0-installer.run \
    && bash -c '/opt/xampp-linux-x64-5.6.23-0-installer.run' \
    && rm -rf /opt/xampp-linux-x64-5.6.23-0-installer.run \
    && mkdir /var/run/mysqld \
    && ln -s /opt/lampp/var/mysql/mysql.sock /var/run/mysqld/mysqld.sock \
    && /opt/lampp/lampp startmysql \
    && mysqladmin -uroot password "root" \
    && mysql -uroot -proot -e "create database phpcmsv9" \
    && sed -ri "s/\['password'\] = '';/\['password'\] = 'root';/g" /opt/lampp/phpmyadmin/config.inc.php

COPY install_package /opt/lampp/htdocs/phpcms

COPY httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf

COPY shell.php /opt/lampp/htdocs/phpcms/uploadfile

COPY run.sh /opt/lampp/run.sh

RUN chmod u+x /opt/lampp/run.sh \
    && chmod -R 777 /opt/lampp/htdocs

WORKDIR /root/

EXPOSE 80 3306

CMD ["/opt/lampp/run.sh"]

# 最后 Phpcms 安装好之后，将 htdocs 文件夹的权限改为 755
# 还有将 phpcms 文件夹打包 tar -zcvf webdate.tar.gz phpcms
