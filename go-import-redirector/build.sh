#!/bin/bash

set -e

# Clone go-import-redirector and enter its directory
git clone https://github.com/rsc/go-import-redirector
pushd go-import-redirector

# Build and publish the image
KO_DOCKER_REPO=gitea.elara.ws/elara6331 \
KO_DEFAULTBASEIMAGE=gitea.elara.ws/elara6331/static \
ko build -B \
	--platform=linux/amd64,linux/arm64,linux/riscv64 \
	--sbom=none

# Leave the go-import-redirector directory
popd
