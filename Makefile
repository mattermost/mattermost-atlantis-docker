ATLANTIS_VERSION ?= v0.33.0
MATTERMOST_ATLANTIS_IMAGE ?= mattermost/atlantis:test
PLATFORMS ?= linux/amd64,linux/arm64
MATTERMOST_ATLANTIS_REPO=mattermost/atlantis

build-image:
	@if [ -z "$(DOCKER_USERNAME)" ] || [ -z "$(DOCKER_PASSWORD)" ]; then \
		echo "DOCKER_USERNAME and/or DOCKER_PASSWORD not set. Skipping Docker login."; \
	else \
		echo $(DOCKER_PASSWORD) | docker login --username $(DOCKER_USERNAME) --password-stdin; \
	fi
	docker buildx build \
		--build-arg ATLANTIS_VERSION=$(ATLANTIS_VERSION) \
		--platform=$(PLATFORMS) \
		-t $(MATTERMOST_ATLANTIS_IMAGE) \
		--push .

build-image-with-tag:
	@if [ -z "$(DOCKER_USERNAME)" ] || [ -z "$(DOCKER_PASSWORD)" ]; then \
		echo "DOCKER_USERNAME and/or DOCKER_PASSWORD not set. Skipping Docker login."; \
	else \
		echo $(DOCKER_PASSWORD) | docker login --username $(DOCKER_USERNAME) --password-stdin; \
	fi
	docker buildx build \
		--build-arg ATLANTIS_VERSION=$(ATLANTIS_VERSION) \
		--platform=$(PLATFORMS) \
		-t $(MATTERMOST_ATLANTIS_IMAGE) \
		-t $(MATTERMOST_ATLANTIS_REPO):${TAG} \
		--push .

.PHONY: push-image-pr
push-image-pr:
	@echo Push Image PR
	./scripts/push-image-pr.sh

.PHONY: push-image
push-image:
	@echo Push Image
	./scripts/push-image.sh
