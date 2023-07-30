#!/bin/bash

if [[ $# == 0 ]]; then
	echo "Usage: $0 <arch>"
	exit 1
fi

docker login gitea.elara.ws
docker build . -t "gitea.elara.ws/elara6331/golang:$1"
docker push "gitea.elara.ws/elara6331/golang:$1"
