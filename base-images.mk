# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.11-alpine := sha256:57e4255cc971b1c8d6f8a6ca283ac01bc3ecdd914273ef6bfaede87aaecd6541
BASE_IMAGE_DIGEST_8.2.10-alpine := sha256:d1389b3f3f981460b9b0918c4d7390c6e9decb8c69b9f09a02e1b6fd7554ade7
BASE_IMAGE_DIGEST_8.4.7-alpine := sha256:f9b3b74607c14a568cf0bda340432ca7ffd0682e3a53183412a8236974bdf69e
BASE_IMAGE_DIGEST_8.6.8-alpine := sha256:7d8d9a58ab3ef32025b06c9f9aeb273d0fb82a79f13d63658e7d7e56ee2f032c

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
