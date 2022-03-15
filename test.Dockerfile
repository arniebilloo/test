
FROM golang:1.17.7-alpine3.14
# Source: https://github.com/docker-library/golang/blob/9bf6daddb324a4d8e82b0613cf348a6eff363f95/1.10/alpine3.7/Dockerfile
LABEL maintainer="a@b.com"

COPY ./build/third-party/vault/vault /usr/bin/vault

RUN printf "http://nl.alpinelinux.org/alpine/v3.13/main\nhttp://dl-2.alpinelinux.org/alpine/v3.13/main\nhttp://dl-3.alpinelinux.org/alpine/v3.13/main\nhttp://dl-4.alpinelinux.org/alpine/v3.13/main\nhttp://dl-5.alpinelinux.org/alpine/v3.13/main" >> /etc/apk/repositories

RUN apk add --update --no-cache \
    openssl \
    ca-certificates \
    bash \
    bash-completion \
    util-linux \
    coreutils \
    binutils \
    findutils \
    grep \
    less \
    git \
    netcat-openbsd


ENV ETCD_HOST=""
ENV SCOPE=development
ENV AWS_REGION=us-west-2
ENV LEVEL=debug

EXPOSE 7979
