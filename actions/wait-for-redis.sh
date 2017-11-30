#!/usr/bin/env bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
    set -x
fi

started=0
host=$1
max_try=$2
wait_seconds=$3
delay_seconds=$4

sleep "${delay_seconds}"

pingRedis() {
    if [[ ! -z "${REDIS_PASSWORD}" ]]; then
        redis-cli -h "${host}" -a "${REDIS_PASSWORD}" ping
    else
        redis-cli -h "${host}" ping
    fi
}

for i in $(seq 1 "${max_try}"); do
    if pingRedis | grep 'PONG' &> /dev/null; then
        started=1
        break
    fi
    echo 'Redis is starting...'
    sleep "${wait_seconds}"
done

if [[ "${started}" -eq '0' ]]; then
    echo >&2 'Error. Redis is unreachable.'
    exit 1
fi

echo 'Redis has started!'