FROM myredmine/myredmine_01debian

#ENV REDIS_VER 2.6.9
ENV REDIS_VER 6.0.10

RUN set -eux; \
       apt update; \
       apt install -y python-pip

RUN set -eux; \
        mkdir -p /usr/src/redis; \
        cd /usr/src/redis; \
        \
#        wget -O redis.tar.gz "https://redis.googlecode.com/files/redis-${REDIS_VER}.tar.gz" ;\
        wget -O redis.tar.gz "https://download.redis.io/releases/redis-${REDIS_VER}.tar.gz" ;\
        tar -xvf redis.tar.gz -C /usr/src/redis --strip-components=1; \
        rm redis.tar.gz; \
        cd /usr/src/redis; \
        cd src; make; \
        make install; \
        :

RUN set -eux; \
        pip install redis

RUN set -eux; \
        useradd -m -s /bin/bash yshima; \
        :

#USER yshima
#WORKDIR /home/yshima

COPY entry_point.sh /

#ENTRYPOINT ["/entry_point.sh"]
ENTRYPOINT ["/usr/local/bin/redis-server"]
