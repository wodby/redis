#!/bin/sh
set -e

if [[ -n $DEBUG ]]; then
  set -x
fi

gotpl "/etc/gotpl/redis.conf.tpl" > "/etc/redis.conf"
sed -i '/^\s*$/d' /etc/redis.conf

exec /usr/local/bin/docker-entrypoint.sh "$@"