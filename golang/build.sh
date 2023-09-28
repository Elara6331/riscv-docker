#!/bin/bash

set -e

lure_cmd="lure --interactive=false build -p default/go-bin"
LURE_ARCH="amd64" $lure_cmd
LURE_ARCH="arm64" $lure_cmd
LURE_ARCH="riscv64" $lure_cmd

mkdir -p pkgs/{x86_64,aarch64,riscv64}
file=(*_x86_64.apk) && mv "$file" "pkgs/x86_64/$(sed -e 's/_x86_64//g' -e 's/_/-/g' <<<$file)"
file=(*_aarch64.apk) && mv "$file" "pkgs/aarch64/$(sed -e 's/_aarch64//g' -e 's/_/-/g' <<<$file)"
file=(*_riscv64.apk) && mv "$file" "pkgs/riscv64/$(sed -e 's/_riscv64//g' -e 's/_/-/g' <<<$file)"

abuild-keygen -na
cp ~/.abuild/*.rsa.pub pkgs/keyring.rsa.pub

for arch in pkgs/*/; do	
	apk index "$arch"/*.apk > "$arch/APKINDEX.tar.gz"
	abuild-sign "$arch/APKINDEX.tar.gz"
done

apko publish --sbom=false apko.yaml gitea.elara.ws/elara6331/golang:latest gitea.elara.ws/elara6331/golang:1.21.1
