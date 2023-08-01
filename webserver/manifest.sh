#!/bin/bash

tag="$1"
tag="${tag:=latest}"

docker login gitea.elara.ws
docker manifest create "gitea.elara.ws/elara6331/webserver:$tag" \
	--amend gitea.elara.ws/elara6331/webserver:amd64 \
	--amend gitea.elara.ws/elara6331/webserver:arm64 \
	--amend gitea.elara.ws/elara6331/webserver:riscv64
docker manifest push "gitea.elara.ws/elara6331/webserver:$tag"
