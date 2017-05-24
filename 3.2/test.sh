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
	docker run --rm -i --link "${name}" "${image}" "${@}" host="${name}"
}

redis make check-ready max_try=10
redis make flushall
