# Generic Redis docker image

[![Build Status](https://travis-ci.org/wodby/redis.svg?branch=master)](https://travis-ci.org/wodby/redis)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)

[![Wodby Slack](https://www.google.com/s2/favicons?domain=www.slack.com) Join us on Slack](https://slack.wodby.com/)

## Supported tags and respective `Dockerfile` links:

- [`3.2-2.0.1`, `3.2`, `latest` (*3.2/Dockerfile*)](https://github.com/wodby/redis/tree/master/3.2/Dockerfile)

## Environment Variables Available for Customization

| Environment Variable | Type | Default Value | Description |
| -------------------- | -----| ------------- | ----------- |
| REDIS_LOGFILE                     | String |                          | |
| REDIS_TCP_BACKLOG                 | Int    | 511                      | | 
| REDIS_TIMEOUT                     | Int    | 300                      | |
| REDIS_TCP_KEEPALIVE               | Int    | 60                       | |
| REDIS_DATABASES                   | Int    | 16                       | |
| REDIS_PASSWORD                    | String |                          | |
| REDIS_DBFILENAME                  | String | dump.rdb                 | |                                    
| REDIS_APPENDONLY                  | String | no                       | |
| REDIS_SAVE_TO_DISK                | Bool   |                          | |
| REDIS_SAVES                       | String | 900:1/300:10/60:10000    | |
| REDIS_MAXMEMORY                   | String | 128m                     | |
| REDIS_MAXMEMORY_POLICY            | String | allkeys-lru              | |
| REDIS_MAXMEMORY_SAMPLES           | Int    | 3                        | |
| REDIS_LIST_MAX_ZIPLIST_ENTRIES    | Int    | 512                      | |
| REDIS_LIST_MAX_ZIPLIST_VALUE      | Int    | 64                       | |
| REDIS_SET_MAX_INTSET_ENTRIES      | Int    | 512                      | |
| REDIS_ACTIVE_REHASHING            | String | yes                      | |
| REDIS_LUA_TIME_LIMIT              | Int    | 5000                     | |
| REDIS_SLOWLOG_SLOWER_THAN         | Int    | 10000                    | |
| REDIS_SLOWLOG_MAX_LEN             | Int    | 32                       | |
| REDIS_LATENCY_MONITOR_THRESHOLD   | Int    | 0                        | |
| REDIS_NOTIFY_KEYSPACE_EVENTS      | String |                          | |

## Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    check-ready host=<redis> max_try=<8> wait_seconds=<5>
    flushall host=<redis>  
    
default params values:
    host localhost
    max_try 30
    wait_seconds 1
```

Examples:

```bash
# Check if Redis is ready
docker exec -ti [ID] make check-ready -f /usr/local/bin/actions.mk

# Flush all cache
docker exec -ti [ID] make flushall host=redis -f /usr/local/bin/actions.mk
```

You can skip -f option if you use run instead of exec. 

## Using in Production

Deploy Redis container to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).
