ARG ATLANTIS_VERSION

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

USER root

RUN apk --no-cache add \
    jq~=1 \
    yq~=4 \
    kubectl~=1 \
	aws-cli \
	&& rm -rf /var/cache/apk/*

RUN mkdir ~/.ssh || true \
    ssh-keyscan -T 240 $GIT_HOST >> ~/.ssh/known_hosts

USER atlantis
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
