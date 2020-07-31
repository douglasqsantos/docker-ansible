# docker run --rm -it alpine:3.12 sh
FROM alpine:3.12

## Setting the root Directory
WORKDIR /ansible

## Installing the packages
RUN apk update && apk upgrade && \
        apk add --no-cache bash \
        fish \
        curl \
        tar \
        vim \
        openssh-client \
        sshpass \
        git \
        python3 \
        py3-pip \
        py3-virtualenv \
        ca-certificates && \
        apk --update add --virtual build-dependencies \
        python3-dev \
        gcc \
        musl-dev \
        libffi-dev \
        openssl-dev

## Preparing the Ansible
RUN pip install --upgrade pip && \
    virtualenv venv && \
    source venv/bin/activate && \
    pip install python-keyczar docker-py boto3 botocore && \
    pip install --upgrade pip && \
    pip install ansible && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

## Default Command to execute
CMD ["/usr/bin/fish"]