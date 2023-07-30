#!/bin/bash

docker manifest create gitea.elara.ws/elara6331/golang:latest \
	--amend gitea.elara.ws/elara6331/golang:amd64 \
	--amend gitea.elara.ws/elara6331/golang:arm64 \
	--amend gitea.elara.ws/elara6331/golang:riscv64
