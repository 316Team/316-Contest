# 高危漏洞 && 命令执行
# 未授权登录

FROM ubuntu:14.04

RUN buildDeps='build-essential \
    curl \
    git \
    wget \
    python-software-properties \
    python \
    g++ \
    make \
#    pkg-config \
#    erlang \
#    libcurl4-openssl-dev \
    erlang-dev \
    erlang-manpages \
    erlang-base-hipe \
    erlang-eunit \
    erlang-nox \
    libmozjs185-dev \
    libicu-dev \
    libcurl4-gnutls-dev \
    libtool'; \
    set -x \
    && apt-get update && apt-get -y install $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove $buildDeps

ADD apache-couchdb-1.6.1.tar.gz /tmp

RUN cd /tmp/apache-couchdb-*/ \
    && ./configure && make \
    && make install \
    && useradd -d /var/lib/couchdb couchdb \
    && mkdir /var/lib/couchdb \
    && mkdir /var/log/couchdb \
    && chown -R couchdb: /var/lib/couchdb /var/log/couchdb \
    && mkdir -p /usr/local/var/{lib,log,run}/couchdb \
    && chown -R couchdb: /usr/local/var/lib/couchdb /usr/local/var/log/couchdb /usr/local/var/run/couchdb /usr/local/etc/couchdb \
    && chmod 0770 /usr/local/var/lib/couchdb/ /usr/local/var/log/couchdb/ /usr/local/var/run/couchdb/ \
    && chmod 664 /usr/local/etc/couchdb/*.ini \
    && chmod 775 /usr/local/etc/couchdb/*.d \
    && cd /etc/init.d \
    && ln -s /usr/local/etc/init.d/couchdb couchdb \
    && sed -ri 's/127.0.0.1/0.0.0.0/g' /usr/local/etc/couchdb/default.ini \
    && update-rc.d couchdb defaults
#    && curl http://127.0.0.1:5984

COPY docker-entrypoint.sh /root/

RUN chmod u+x /root/docker-entrypoint.sh

WORKDIR /root/

EXPOSE 5984

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["couchdb"]