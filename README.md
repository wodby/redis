# Redis Docker Container Image

[![Build Status](https://github.com/wodby/redis/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/redis/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/redis:7-X.X.X`) which correspond to [git tags](https://github.com/wodby/redis/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [redis](https://github.com/docker-library/redis)
- [GitHub actions builds](https://github.com/wodby/redis/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/redis)

[_(Dockerfile)_]: https://github.com/wodby/redis/tree/master/Dockerfile

Supported tags and respective `Dockerfile` links:

- `7`, `latest` [_(Dockerfile)_]
- `6` [_(Dockerfile)_]
- `5` [_(Dockerfile)_]

All images built for `linux/amd64` and `linux/arm64`

## Environment Variables

| Variable                          | Default Value           | Description |
|-----------------------------------|-------------------------|-------------|
| `REDIS_ACTIVE_REHASHING`          | `yes`                   |             |
| `REDIS_APPENDONLY`                | `no`                    |             |
| `REDIS_DATABASES`                 | `16`                    |             |
| `REDIS_DBFILENAME`                | `dump.rdb`              |             |
| `REDIS_LATENCY_MONITOR_THRESHOLD` | `0`                     |             |
| `REDIS_LIST_MAX_ZIPLIST_ENTRIES`  | `512`                   |             |
| `REDIS_LIST_MAX_ZIPLIST_VALUE`    | `64`                    |             |
| `REDIS_LOGFILE`                   |                         |             |
| `REDIS_LUA_TIME_LIMIT`            | `5000`                  |             |
| `REDIS_MAXMEMORY`                 | `128m`                  |             |
| `REDIS_MAXMEMORY_POLICY`          | `allkeys-lru`           |             |
| `REDIS_MAXMEMORY_SAMPLES`         | `3`                     |             |
| `REDIS_NOTIFY_KEYSPACE_EVENTS`    |                         |             |
| `REDIS_PASSWORD`                  |                         |             |
| `REDIS_SAVE_TO_DISK`              |                         |             |
| `REDIS_SAVES`                     | `900:1/300:10/60:10000` |             |
| `REDIS_SET_MAX_INTSET_ENTRIES`    | `512`                   |             |
| `REDIS_SLOWLOG_MAX_LEN`           | `32`                    |             |
| `REDIS_SLOWLOG_SLOWER_THAN`       | `10000`                 |             |
| `REDIS_TCP_BACKLOG`               | `511`                   |             |
| `REDIS_TCP_KEEPALIVE`             | `60`                    |             |
| `REDIS_TIMEOUT`                   | `300`                   |             |

## Orchestration Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    check-ready host max_try wait_seconds delay_seconds
    flushall host
    
default params values:
    host localhost
    max_try 1
    wait_seconds 1
    delay_seconds 0
```

## Deployment

Deploy Redis to your server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com/stacks/redis).
