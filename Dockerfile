# Minimal Docker image for DIAMOND using Alpine base
FROM alpine:latest

# install DIAMOND
RUN apk update && \
    apk add --no-cache automake bash cmake g++ linux-headers make musl-dev sqlite-dev zlib-dev && \
    wget -qO- "https://github.com/bbuchfink/diamond/archive/refs/tags/v2.2.8.tar.gz" | tar -zx && \
    cd diamond-* && \
    cmake . && \
    make && \
    make install && \
    cd .. && \
    rm -rf diamond-*
