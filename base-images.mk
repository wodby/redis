# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.11-alpine := sha256:520775a41a63e77e06c73e35d2fd9cc15921a609516818796b4ecbb813078bc7
BASE_IMAGE_DIGEST_8.2.9-alpine := sha256:e957842a3e7962bfe3e5ab9814eab06e029a2f0d7b0f5d74178af12713b9ab4d
BASE_IMAGE_DIGEST_8.4.7-alpine := sha256:6935373cd72add2b46b624158d841afdeef5cce1dc6fe9e6d0cb94bb677169ad
BASE_IMAGE_DIGEST_8.6.7-alpine := sha256:79aff60c78f59416f3f639f810a11938d3e854d31c83675e3d8c52e8cc5b5208

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
