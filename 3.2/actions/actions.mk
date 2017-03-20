.PHONY: flush check-ready check-live

host ?= localhost
max_try ?= 30
wait_seconds ?= 1

default: check-ready

flushall:
	flushall.sh $(host)

check-ready:
	wait-for-redis.sh $(host) $(max_try) $(wait_seconds)

check-live:
	@echo "OK"
