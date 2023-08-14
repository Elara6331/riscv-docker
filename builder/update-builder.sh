#!/bin/bash

set -e

docker build . -t gitea.elara.ws/elara6331/builder:latest --no-cache
docker login gitea.elara.ws
docker push gitea.elara.ws/elara6331/builder:latest
