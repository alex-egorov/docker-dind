FROM alpine:3.6
MAINTAINER Alex Egorov <alex202@egorov.net>
# from jpetazzo/dind

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/alex-egorov/docker-helm" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"
      

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker

# Install Docker and dependencies
RUN apk --update add \
  bash \
  iptables \
  ca-certificates \
  e2fsprogs \
  docker \
  && chmod +x /usr/local/bin/wrapdocker \
  && rm -rf /var/cache/apk/*

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]