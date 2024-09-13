# mattermost-atlantis-docker

This repository contains the necessary files to build a custom Docker image for the [Atlantis](https://github.com/runatlantis/atlantis) tool using Docker Buildx. It supports building multi-platform images and pushing them to Docker Hub.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://www.docker.com/) with [Buildx](https://docs.docker.com/buildx/working-with-buildx/) enabled
- Make sure you are logged into Docker Hub or have the credentials available for login

## Environment Variables

To push the image to Docker Hub, the following environment variables should be set:

- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password or access token

## Variables

The Makefile accepts the following optional variables:

- `ATLANTIS_VERSION`: The version of Atlantis to include in the Docker image. Defaults to `v0.27.3`.
- `MATTERMOST_ATLANTIS_IMAGE`: The name of the Docker image to build. Defaults to `mattermost/atlantis:test`.
- `PLATFORMS`: The platforms for which to build the image. Defaults to `linux/amd64,linux/arm64`.
- `MATTERMOST_ATLANTIS_REPO`: The Docker repository where the image will be pushed. Defaults to `mattermost/atlantis`.

## Makefile Targets

### `build-image`

This command builds the Docker image and pushes it to the Docker repository specified by `MATTERMOST_ATLANTIS_IMAGE`.

```bash
make build-image
