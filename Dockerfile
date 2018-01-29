FROM alpine:3.7
MAINTAINER Alex Egorov <alex202@egorov.net>
# from jpetazzo/dind

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