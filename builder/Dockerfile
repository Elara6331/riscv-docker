FROM alpine:edge
RUN apk add --no-cache go yq git gcc bash abuild
RUN apk add --no-cache ko --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add --no-cache --allow-untrusted apko --repository=https://packages.wolfi.dev/os
RUN wget -O lure.tar.gz https://gitea.elara.ws/lure/lure/releases/download/v0.1.2/lure-0.1.2-linux-x86_64.tar.gz && \
	tar xvf lure.tar.gz && \
	install -Dm755 lure /usr/bin/lure && \
	rm -r lure scripts
COPY lure.toml /root/.config/lure/lure.toml
COPY login.sh /bin/registry-login
