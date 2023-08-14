FROM alpine:edge
RUN apk add --no-cache go git gcc bash abuild
RUN apk add --no-cache ko --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add --no-cache --allow-untrusted apko --repository=https://packages.wolfi.dev/os
RUN wget -O /usr/bin/lure https://api.minio.elara.ws/adl/lure/lure-amd64 && chmod +x /usr/bin/lure
COPY lure.toml /root/.config/lure/lure.toml
COPY login.sh /bin/registry-login
