#!/bin/sh

set -e

if [[ ! -z "${DEBUG}" ]]; then
  set -x
fi

gotpl "/etc/gotpl/redis.conf.tpl" > "/etc/redis.conf"
sed -i '/^\s*$/d' /etc/redis.conf

if [[ $1 == "make" ]]; then
    exec /usr/local/bin/docker-entrypoint.sh "${@}" -f /usr/local/bin/actions.mk
else
    exec /usr/local/bin/docker-entrypoint.sh "${@}"
fi
