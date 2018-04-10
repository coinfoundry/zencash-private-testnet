FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/ZencashOfficial/zen/releases/download/v2.0.11/zen-2.0.11-amd64.deb \
    /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get update -y && apt-get upgrade -y && \
    apt-get install libgomp1 wget -y && \
    dpkg -i /tmp/zen-2.0.11-amd64.deb

RUN zen-fetch-params && \
    mv /root/.zcash-params / && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
