#!/bin/bash
set -exo pipefail

image="$1"

cname="redis-container-$RANDOM-$RANDOM"
cid="$(docker run -d --name "$cname" "$image")"
trap "docker rm -vf $cid > /dev/null" EXIT

redis-cli() {
	docker run --rm -i \
		--link "$cname":redis \
		--entrypoint redis-cli \
		"$image" \
		-h redis \
		"$@"
}

waitForRedis() {
    done=''

    for i in {30..0}; do
        if $(redis-cli ping | grep 'PONG' &> /dev/null); then
            done=1
            break
        fi
        echo 'Redis start process in progress...'
        sleep 5
    done

    if [[ ! "${done}" ]]; then
        echo "Failed to start Redis" >&2
        exit 1
    fi
}

waitForRedis

[ "$(redis-cli set mykey somevalue)" = 'OK' ]
[ "$(redis-cli get mykey)" = 'somevalue' ]