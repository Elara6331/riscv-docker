#!/bin/bash
set -e
apko publish --sbom=false apko.yaml gitea.elara.ws/elara6331/static:latest 
