daemonize no
pidfile /var/run/redis/redis.pid
{{ if getenv "REDIS_LOGFILE" }}logfile {{ getenv "REDIS_LOGFILE" }}{{ end }}
port 6379
tcp-backlog {{ getenv "REDIS_TCP_BACKLOG" "511" }}
bind 0.0.0.0
timeout {{ getenv "REDIS_TIMEOUT" "300" }}
tcp-keepalive {{ getenv "REDIS_TCP_KEEPALIVE" "60" }}
databases {{ getenv "REDIS_DATABASES" "16" }}
{{ if getenv "REDIS_PASSWORD" }}requirepass {{ getenv "REDIS_PASSWORD" }}{{ end }}
appendonly {{ getenv "REDIS_APPENDONLY" "no" }}
{{ if getenv "REDIS_SAVE_TO_DISK" }}
dir /var/lib/redis
dbfilename {{ getenv "REDIS_DBFILENAME" "dump.rdb" }}
{{ $saves := split (getenv "REDIS_SAVES" "900:1/300:10/60:10000") "/" }}
{{ range $saves }}
{{ $save := split . ":" }}
save {{ index $save 0 }} {{ index $save 1 }}
{{ end }}
{{ end }}
maxmemory {{ getenv "REDIS_MAXMEMORY" "128m" }}
maxmemory-policy {{ getenv "REDIS_MAXMEMORY_POLICY" "allkeys-lru" }}
maxmemory-samples {{ getenv "REDIS_MAXMEMORY_SAMPLES" "3" }}
list-max-ziplist-entries {{ getenv "REDIS_LIST_MAX_ZIPLIST_ENTRIES" "512" }}
list-max-ziplist-value {{ getenv "REDIS_LIST_MAX_ZIPLIST_VALUE" "64" }}
set-max-intset-entries {{ getenv "REDIS_SET_MAX_INTSET_ENTRIES" "512" }}
activerehashing {{ getenv "REDIS_ACTIVE_REHASHING" "yes" }}
lua-time-limit {{ getenv "REDIS_LUA_TIME_LIMIT" "5000" }}
slowlog-log-slower-than {{ getenv "REDIS_SLOWLOG_SLOWER_THAN" "10000" }}
slowlog-max-len {{ getenv "REDIS_SLOWLOG_MAX_LEN" "32" }}
latency-monitor-threshold {{ getenv "REDIS_LATENCY_MONITOR_THRESHOLD" "0" }}
notify-keyspace-events "{{ getenv "REDIS_NOTIFY_KEYSPACE_EVENTS" "" }}"
