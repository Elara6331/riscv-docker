#!/bin/bash

pushd go-import-redirector
KO_DOCKER_REPO=gitea.elara.ws/elara6331 ko build -B \
	--platform=linux/amd64,linux/arm64,linux/riscv64 \
	--sbom=none
popd
