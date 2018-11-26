#!/bin/bash

set -x

REGISTRY_URL=registry.do.stich.io/tools

# HUGO_VERSION=$(grep -Eo 'HUGO_VERSION=(\d+\.\d+\.\d+|\d+\.\d+)' Dockerfile)

HUGO_VERSION=0.51-alpine-rc1

docker build -t ${REGISTRY_URL}/hugo:${HUGO_VERSION} .
docker push  ${REGISTRY_URL}/hugo:${HUGO_VERSION}
