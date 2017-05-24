# Redis docker container image

[![Build Status](https://travis-ci.org/wodby/redis.svg?branch=master)](https://travis-ci.org/wodby/redis)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)

## Supported tags and respective `Dockerfile` links:

- [`3.2-2.0.1`, `3.2`, `latest` (*3.2/Dockerfile*)](https://github.com/wodby/redis/tree/master/3.2/Dockerfile)

## Environment variables available for customization

| Environment Variable | Default Value | Description |
| -------------------- | ------------- | ----------- |
| REDIS_LOGFILE                     |                          | |
| REDIS_TCP_BACKLOG                 | 511                      | | 
| REDIS_TIMEOUT                     | 300                      | |
| REDIS_TCP_KEEPALIVE               | 60                       | |
| REDIS_DATABASES                   | 16                       | |
| REDIS_PASSWORD                    |                          | |
| REDIS_DBFILENAME                  | dump.rdb                 | |                                    
| REDIS_APPENDONLY                  | no                       | |
| REDIS_SAVE_TO_DISK                |                          | |
| REDIS_SAVES                       | 900:1/300:10/60:10000    | |
| REDIS_MAXMEMORY                   | 128m                     | |
| REDIS_MAXMEMORY_POLICY            | allkeys-lru              | |
| REDIS_MAXMEMORY_SAMPLES           | 3                        | |
| REDIS_LIST_MAX_ZIPLIST_ENTRIES    | 512                      | |
| REDIS_LIST_MAX_ZIPLIST_VALUE      | 64                       | |
| REDIS_SET_MAX_INTSET_ENTRIES      | 512                      | |
| REDIS_ACTIVE_REHASHING            | yes                      | |
| REDIS_LUA_TIME_LIMIT              | 5000                     | |
| REDIS_SLOWLOG_SLOWER_THAN         | 10000                    | |
| REDIS_SLOWLOG_MAX_LEN             | 32                       | |
| REDIS_LATENCY_MONITOR_THRESHOLD   | 0                        | |
| REDIS_NOTIFY_KEYSPACE_EVENTS      |                          | |

## Actions

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

Examples:

```bash
# Check if Redis is ready
docker exec -ti [ID] make check-ready -f /usr/local/bin/actions.mk

# Flush all cache
docker exec -ti [ID] make flushall host=redis -f /usr/local/bin/actions.mk
```

You can skip -f option if you use run instead of exec. 

## Using in production

Deploy Redis container to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).
