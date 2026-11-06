# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := redis
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.4.12-alpine := sha256:c5d34a98396a4775e223c74e929162c35c5a2182901ba26b50ade939941ce14b
BASE_IMAGE_DIGEST_8.2.11-alpine := sha256:fe9daae35cd4fd6ec22416aa4fe0cf6b3e36741e06ff45b9986253fe2a81c041
BASE_IMAGE_DIGEST_8.4.8-alpine := sha256:44b295aedd412d52a9846f51573e906e0a9c7d83ba431f4134b1b338d45ba732
BASE_IMAGE_DIGEST_8.6.8-alpine := sha256:c343030a535c8c2e430e038f25cca7cfa7497a2b290f12ba2f9003bdfb3086b9

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
