# Use Alpine Linux as our base image so that we minimize the overall size our final container, and minimize the surface area of packages that could be out of date.
FROM alpine:3.8@sha256:621c2f39f8133acb8e64023a94dbdf0d5ca81896102b9e57c0dc184cadaf5528

LABEL description="Docker container for building static sites with the Hugo static site generator (Extended version)."
LABEL maintainer="HD Stich <hd.stich.io>"

ENV HUGO_VERSION=0.54.0

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp

RUN tar -xf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mv /tmp/hugo /bin/hugo \
    && rm -rf /tmp/hugo_extended_${HUGO_VERSION}_linux_amd64 \
    && rm -rf /tmp/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN apk add --update git git-lfs libc6-compat libstdc++ \
   && apk upgrade \
   && apk add --no-cache ca-certificates

VOLUME /src
VOLUME /dest

WORKDIR /src
CMD ["hugo"]
