# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.11-alpine := sha256:858f009f9709ce576febc734aa78b8f6d624b82571f9ddb6bda4377c833b3499
BASE_IMAGE_DIGEST_8.2.10-alpine := sha256:8d02c1dc547ea659066d2ca18fce4e80f0a84cfe56a61af2ced2c2a48de3597c
BASE_IMAGE_DIGEST_8.4.7-alpine := sha256:6935373cd72add2b46b624158d841afdeef5cce1dc6fe9e6d0cb94bb677169ad
BASE_IMAGE_DIGEST_8.6.7-alpine := sha256:79aff60c78f59416f3f639f810a11938d3e854d31c83675e3d8c52e8cc5b5208

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
