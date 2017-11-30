# Redis Docker Container Image

[![Build Status](https://travis-ci.org/wodby/redis.svg?branch=master)](https://travis-ci.org/wodby/redis)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Layers](https://images.microbadger.com/badges/image/wodby/redis.svg)](https://microbadger.com/images/wodby/redis)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Docker Images

* All images are based on Alpine Linux
* Base image: [_/redis](https://hub.docker.com/r/_/redis)
* [Travis CI builds](https://travis-ci.org/wodby/redis) 
* [Docker Hub](https://hub.docker.com/r/wodby/redis)

[_(Dockerfile)_]: https://github.com/wodby/redis/tree/master/Dockerfile

Supported tags and respective `Dockerfile` links:

* `4`, `4.0`, `latest` [_(Dockerfile)_]
* `3`, `3.2` [_(Dockerfile)_]

For better reliability we additionally release images with stability tags (`wodby/redis:4.0-X.X.X`) which correspond to [git tags](https://github.com/wodby/redis/releases). We **strongly recommend** using images only with stability tags.

## Environment Variables

| Variable                        | Default Value         | Description |
| ------------------------------- | --------------------- | ----------- |
| REDIS_LOGFILE                   |                       |             |
| REDIS_TCP_BACKLOG               | 511                   |             |
| REDIS_TIMEOUT                   | 300                   |             |
| REDIS_TCP_KEEPALIVE             | 60                    |             |
| REDIS_DATABASES                 | 16                    |             |
| REDIS_PASSWORD                  |                       |             |
| REDIS_DBFILENAME                | dump.rdb              |             |
| REDIS_APPENDONLY                | no                    |             |
| REDIS_SAVE_TO_DISK              |                       |             |
| REDIS_SAVES                     | 900:1/300:10/60:10000 |             |
| REDIS_MAXMEMORY                 | 128m                  |             |
| REDIS_MAXMEMORY_POLICY          | allkeys-lru           |             |
| REDIS_MAXMEMORY_SAMPLES         | 3                     |             |
| REDIS_LIST_MAX_ZIPLIST_ENTRIES  | 512                   |             |
| REDIS_LIST_MAX_ZIPLIST_VALUE    | 64                    |             |
| REDIS_SET_MAX_INTSET_ENTRIES    | 512                   |             |
| REDIS_ACTIVE_REHASHING          | yes                   |             |
| REDIS_LUA_TIME_LIMIT            | 5000                  |             |
| REDIS_SLOWLOG_SLOWER_THAN       | 10000                 |             |
| REDIS_SLOWLOG_MAX_LEN           | 32                    |             |
| REDIS_LATENCY_MONITOR_THRESHOLD | 0                     |             |
| REDIS_NOTIFY_KEYSPACE_EVENTS    |                       |             |

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

Deploy Redis to your server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://cloud.wodby.com/stackhub/7548eb5a-c61b-4480-9f36-2501917692b3).

