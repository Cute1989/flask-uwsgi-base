FROM python:3.6.8-alpine3.9
LABEL maintainer="ljy_coder@163.com"
RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir flask uwsgi
WORKDIR /flask