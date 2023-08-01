#!/bin/bash

if [[ $# == 0 ]]; then
	echo "Usage: $0 <arch>"
	exit 1
fi

GOOS=linux GOARCH=$1 go build -o webserver ./cmd/main.go

docker login gitea.elara.ws
docker build . -t "gitea.elara.ws/elara6331/webserver:$1"
docker push "gitea.elara.ws/elara6331/webserver:$1"
