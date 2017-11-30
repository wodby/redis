ARG FROM_TAG

FROM redis:${FROM_TAG}

ARG REDIS_VER

ENV REDIS_VER="${REDIS_VER}" \
    GOTPL_VER="0.1.5"

RUN apk add --update --no-cache --virtual .redis-rundeps \
        bash \
        ca-certificates \
        make \
        tar \
        tzdata \
        wget && \

    wget -qO- https://github.com/wodby/gotpl/releases/download/${GOTPL_VER}/gotpl-alpine-linux-amd64-${GOTPL_VER}.tar.gz | tar xz -C /usr/local/bin && \

    rm -rf /var/cache/apk/*

COPY redis.conf.tpl /etc/gotpl/

COPY docker-entrypoint.sh /
COPY actions /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "redis-server" , "/etc/redis.conf" ]
