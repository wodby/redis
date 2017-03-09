# Generic Redis docker image

[![Build Status](https://travis-ci.org/wodby/redis.svg?branch=master)](https://travis-ci.org/wodby/redis)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/redis.svg)](https://hub.docker.com/r/wodby/redis)

## Supported tags and respective `Dockerfile` links:

- [`3.2`, `latest` (*3.2/Dockerfile*)](https://github.com/wodby/redis/tree/master/3.2/Dockerfile)

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
