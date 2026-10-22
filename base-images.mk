# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.11-alpine := sha256:892022f9f18c26c92c30e15194d132f90044af87b94a491a75429bbc3982eab1
BASE_IMAGE_DIGEST_8.2.10-alpine := sha256:98561ce71de3f1126e799d127a7700e8057264c9ae34cb12e662ff4d6fbefd3f
BASE_IMAGE_DIGEST_8.4.7-alpine := sha256:9b74c5d0f445d8a0be8522bcb638c93a6c31dbc7c2d69c4dac4a74ee5f02126a
BASE_IMAGE_DIGEST_8.6.7-alpine := sha256:89fccf1e772bd25ec42957d3ecaf2293fa79516b64b1c85d6343e847326a79d6

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
