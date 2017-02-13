FROM debian:jessie

# apt-get 安装软件时，尽量按照字母顺序来安装 #

RUN buildDeps='gcc libc6-dev make wget'; \
    set -x \
    && apt-get update && apt-get install -y --no-install-recommends $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && wget http://download.redis.io/releases/redis-3.2.4.tar.gz \
    && tar zxf redis-3.2.4.tar.gz \
    && rm -rf redis-3.2.4.tar.gz \
    && cd redis-3.2.4 \
    && make \
    && apt-get purge -y --auto-remove $buildDeps \
    && mkdir /var/log/redis \
    && touch /var/log/redis/redis.log \
    && sed -ri 's/bind 127.0.0.1/bind 0.0.0.0/g' /redis-3.2.4/redis.conf \
    && sed -ri 's#logfile \"\"#logfile /var/log/redis/redis.log#g' /redis-3.2.4/redis.conf \
    && sed -ri 's/loglevel notice/loglevel verbose/g' /redis-3.2.4/redis.conf \
    && sed -ri 's/protected-mode yes/protected-mode no/g' /redis-3.2.4/redis.conf \
#   protected-mode yes|no 是否开启远程连接
#    && sed -ri 's/daemonize no/daemonize yes/g' /redis-3.2.4/redis.conf \
#   daemonize yes|no redis 是否后台启动
    && echo '#!/bin/bash\n/redis-3.2.4/src/redis-server /redis-3.2.4/redis.conf' > /redis-3.2.4/run.sh \
    && chmod u+x /redis-3.2.4/run.sh

# 日志文件位置 '/var/log' '/redis-3.2.4/nohup.out' #

EXPOSE 6379

CMD ["/redis-3.2.4/run.sh"]


# payload:
#       Accepted *.*.*.*:*