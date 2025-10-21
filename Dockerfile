ARG ATLANTIS_VERSION

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

USER root

RUN apk --no-cache add \
    sed \
    openssl \
    jq~=1 \
    yq~=4 \
    kubectl~=1 \
	aws-cli \
	python3 \
	py3-pip \
	zip \
	&& rm -rf /var/cache/apk/*

USER atlantis
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
