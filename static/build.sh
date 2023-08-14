#!/bin/bash
set -e
apko publish --sbom=false apko.yaml gitea.elra.ws/elara6331/static:latest 
