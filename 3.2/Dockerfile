FROM redis:3.2-alpine

ENV GOTLP_VER 0.1.5

RUN apk add --no-cache \
        bash \
        ca-certificates \
        tar \
        tzdata \
        wget && \

    wget -qO- https://github.com/wodby/gotpl/releases/download/${GOTLP_VER}/gotpl-alpine-linux-amd64-${GOTLP_VER}.tar.gz | tar xz -C /usr/local/bin

COPY redis.conf.tpl /etc/gotpl/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "redis-server" , "/etc/redis.conf" ]
