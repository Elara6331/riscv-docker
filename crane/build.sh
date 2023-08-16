#!/bin/bash

set -e

# Clone go-containerregistry and enter crane's directory
git clone --depth=1 https://github.com/google/go-containerregistry.git
pushd go-containerregistry/cmd/crane

# Build and publish the image
KO_DOCKER_REPO=gitea.elara.ws/elara6331 \
KO_DEFAULTBASEIMAGE=gitea.elara.ws/elara6331/busybox \
ko build -B \
	--platform=linux/amd64,linux/arm64,linux/riscv64 \
	--sbom=none

# Leave crane's directory
popd
