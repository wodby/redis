#!/usr/bin/env bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
    set -x
fi

name=$1
image=$2

cid="$(docker run -d --name "${name}" "${image}")"
trap "docker rm -vf $cid > /dev/null" EXIT

redis() {
	docker run --rm -i --link "${name}" "${image}" "${@}"
}

redis make check-ready max_try=10 host="${name}"

echo -n "Checking Redis version... "
redis redis-server -v | grep -q "v=4.0.1"
echo "OK"

echo -n "Flushing Redis cache... "
redis make flushall host="${name}"
echo "OK"
