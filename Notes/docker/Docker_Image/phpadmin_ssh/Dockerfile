FROM ubuntu:14.04

RUN apt-get update && apt-get install -y openssh-client openssh-server \
    && mkdir -p /var/run/sshd \
    && sed -ri 's/session    required     pam_loginuid.so/#session     required     pam_loginuid.so/g' /etc/pam.d/sshd

COPY xampp-linux-x64-5.6.23-0-installer.run /opt/xampp-linux-x64-5.6.23-0-installer.run

RUN echo "#!/bin/bash" > /root/run.sh \
    && echo "/usr/sbin/sshd -D" >> /root/run.sh \
    && chmod u+x /root/run.sh \
    && echo "root:root" | chpasswd \
    && sed -ri 's/PermitRootLogin without-password/#PermitRootLogin without-password/g' /etc/ssh/sshd_config \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && chmod u+x /opt/xampp-linux-x64-5.6.23-0-installer.run \
    && bash -c '/opt/xampp-linux-x64-5.6.23-0-installer.run' \
    && rm -rf /opt/xampp-linux-x64-5.6.23-0-installer.run

COPY install_package /opt/lampp/htdocs/phpcms

COPY httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf

COPY shell.php /opt/lampp/phpmyadmin

COPY run.sh /opt/lampp/run.sh

RUN chmod u+x /opt/lampp/run.sh \
    && chmod -R 777 /opt/lampp/htdocs

WORKDIR /root/

EXPOSE 22 80 3306

CMD ["/root/run.sh"]

CMD ["/opt/lampp/run.sh"]