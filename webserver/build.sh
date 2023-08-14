#!/bin/bash

set -e

pushd cmd
KO_DOCKER_REPO=gitea.elara.ws/elara6331 \
KO_DEFAULTBASEIMAGE=gitea.elara.ws/elara6331/static \
ko build -B \
	--platform=linux/amd64,linux/arm64,linux/riscv64 \
	--sbom=none
popd
