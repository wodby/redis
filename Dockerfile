ARG BASE_IMAGE_TAG

FROM redis:${BASE_IMAGE_TAG}

ARG REDIS_VER

ENV REDIS_VER="${REDIS_VER}" \
    GOTPL_VER="0.1.5"

RUN apk add --update --no-cache -t .redis-rundeps \
        bash \
        make \
        tzdata; \
    \
    apk add --update --no-cache -t .redis-build-deps \
        ca-certificates \
        tar \
        wget; \
    \
    gotpl_url="https://github.com/wodby/gotpl/releases/download/${GOTPL_VER}/gotpl-alpine-linux-amd64-${GOTPL_VER}.tar.gz"; \
    wget -qO- "${gotpl_url}" | tar xz -C /usr/local/bin; \
    \
    apk del .redis-build-deps; \
    rm -rf /var/cache/apk/*

COPY redis.conf.tpl /etc/gotpl/

COPY docker-entrypoint.sh /
COPY actions /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "redis-server" , "/etc/redis.conf" ]
