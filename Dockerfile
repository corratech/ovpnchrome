ARG BASE_IMAGE=corratech/cordeal:latest
LABEL maintainer="anish.asokan@corra.com"
LABEL repo="https://github.com/corratech/ovpnchrome/"
USER root
WORKDIR "/"

RUN apt-get -qq update && \
    apt-get -y install bash curl wget unzip tar openvpn openssl jq \
    nano telnet git build-essential autoconf libtool tmux chromium chromium-l10n
RUN apt-get -qq clean && rm -rf /var/lib/apt/lists/* /var/tmp/*
RUN mkdir -p /vpn /ovpn 

VOLUME /ovpn
VOLUME /usedvpns

EXPOSE 3000/tcp
EXPOSE 3001/tcp

CMD ["/bin/bash", "--login"]
