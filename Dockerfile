ARG ATLANTIS_VERSION

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

USER root

RUN apk --no-cache add \
    sed \
    jq~=1 \
    yq~=4 \
    kubectl~=1 \
	aws-cli \
	&& rm -rf /var/cache/apk/*

USER atlantis
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["server"]
