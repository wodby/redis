#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

chown redis:redis /data
gotpl "/etc/gotpl/redis.conf.tpl" > "/etc/redis.conf"
sed -i '/^\s*$/d' /etc/redis.conf

if [[ $1 == "make" ]]; then
    exec "${@}" -f /usr/local/bin/actions.mk
else
    exec /usr/local/bin/docker-entrypoint.sh "${@}"
fi
