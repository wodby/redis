# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.12-alpine := sha256:7f7d30b7fdd09467bac58198a1f166dd69789d348d4fe859cccb20e0cf287fbe
BASE_IMAGE_DIGEST_8.2.11-alpine := sha256:da23c2478319ceb4903857d77a2fd7aa5137d9e9d4c8165dafbacedac6403e95
BASE_IMAGE_DIGEST_8.4.8-alpine := sha256:ff72f74e4f471df79ed920aa8bbc35efe72ff8a1f8acdc50aad5dbb9b14a4034
BASE_IMAGE_DIGEST_8.6.8-alpine := sha256:91c71f9ea78fa3fe268ff832a985c48e592244f707993773f8b3e1b244ac1137

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
