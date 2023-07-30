#!/bin/bash

tag="$1"
tag="${tag:=latest}"

docker login gitea.elara.ws
docker manifest create "gitea.elara.ws/elara6331/golang:$tag" \
	--amend gitea.elara.ws/elara6331/golang:amd64 \
	--amend gitea.elara.ws/elara6331/golang:arm64 \
	--amend gitea.elara.ws/elara6331/golang:riscv64
docker manifest push "gitea.elara.ws/elara6331/golang:$tag"
