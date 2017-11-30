#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

cid="$(docker run -d -e DEBUG --name "${NAME}" "${IMAGE}")"
trap "docker rm -vf $cid > /dev/null" EXIT

redis() {
	docker run --rm -i -e DEBUG --link "${NAME}" "${IMAGE}" "${@}"
}

redis make check-ready max_try=10 host="${NAME}"

echo -n "Checking Redis version... "
redis redis-server -v | grep -q "v=${REDIS_VER}"
echo "OK"

echo -n "Flushing Redis cache... "
redis make flushall host="${NAME}"
echo "OK"
