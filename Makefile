-include env_make

REDIS_VER ?= 8.6.7
REDIS_VER_MINOR = $(shell echo "${REDIS_VER}" | grep -oE '^[0-9]+\.[0-9]+')

TAG ?= $(REDIS_VER_MINOR)

REPO = wodby/redis
NAME = redis-$(REDIS_VER)

PLATFORM ?= linux/arm64

ifneq ($(ARCH),)
	override TAG := $(TAG)-$(ARCH)
endif

.PHONY: build buildx-build buildx-push test push shell run start stop logs clean release

# Resolve the same pinned base image for every local and CI build target.
include base-images.mk
BASE_IMAGE_TAG = $(REDIS_VER)-alpine

default: build

build:
	docker build --build-arg BASE_IMAGE="$(BASE_IMAGE)" -t $(REPO):$(TAG) \
		--build-arg REDIS_VER=$(REDIS_VER) \
		./

buildx-build:
	docker buildx build --build-arg BASE_IMAGE="$(BASE_IMAGE)" --platform $(PLATFORM) -t $(REPO):$(TAG) \
		--build-arg REDIS_VER=$(REDIS_VER) \
		--load \		
		./

buildx-push:
	docker buildx build --build-arg BASE_IMAGE="$(BASE_IMAGE)" --platform $(PLATFORM) --push -t $(REPO):$(TAG) \
		--build-arg REDIS_VER=$(REDIS_VER) \
		./

buildx-imagetools-create:
	docker buildx imagetools create -t $(REPO):$(TAG) \
				$(REPO):$(REDIS_VER_MINOR)-amd64 \
				$(REPO):$(REDIS_VER_MINOR)-arm64
.PHONY: buildx-imagetools-create

test:
	cd ./tests && IMAGE=$(REPO):$(TAG) NAME=$(NAME) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) -e DEBUG=1 $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push

# Keep CI scans aligned with the version, variant and architecture built by make.
.PHONY: image-ref
image-ref:
	@printf '%s\n' '$(REPO):$(TAG)'
