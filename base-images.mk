# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.12-alpine := sha256:8da19c7399dca900c6822a1cf30f9d2285585e2c4b457ff4095b0f4500054d3f
BASE_IMAGE_DIGEST_8.2.11-alpine := sha256:489a769e0a54dc245896132a15c72d2bc7296719954da99398f43a3877e5f8eb
BASE_IMAGE_DIGEST_8.4.8-alpine := sha256:3e393dc9c57e628ebd5e0fc0bc4524f83632b6b873503d619e856af9322d4ef7
BASE_IMAGE_DIGEST_8.6.8-alpine := sha256:f4ed7d6732f9a5dcc6b64e2b347860b9f329334bfd4839a672f78cd981a8bba6

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
