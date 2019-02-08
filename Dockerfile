ARG BASE_IMAGE_TAG

FROM redis:${BASE_IMAGE_TAG}

ARG REDIS_VER

ENV REDIS_VER="${REDIS_VER}" \
    GOTPL_VER="0.1.5"

RUN apk add --update --no-cache -t .wodby-redis-run-deps \
        bash \
        make \
        tzdata; \
    \
    apk add --update --no-cache -t .wodby-redis-build-deps \
        ca-certificates \
        tar \
        wget; \
    \
    gotpl_url="https://github.com/wodby/gotpl/releases/download/${GOTPL_VER}/gotpl-alpine-linux-amd64-${GOTPL_VER}.tar.gz"; \
    wget -qO- "${gotpl_url}" | tar xz -C /usr/local/bin; \
    \
    apk del .wodby-redis-build-deps; \
    rm -rf /var/cache/apk/*

COPY templates /etc/gotpl/

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "redis-server" , "/etc/redis.conf" ]
