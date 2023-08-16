#!/bin/bash
set -e
apko publish \
	--sbom=false \
	--package-version-tag=nodejs-current \
	apko.yaml \
	gitea.elara.ws/elara6331/node:latest 
