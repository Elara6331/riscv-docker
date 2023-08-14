# riscv-docker

This repo contains custom docker images that I'm using for my cluster. You can find the containers I build from these in the [Packages](https://gitea.elara.ws/Elara6331/riscv-docker/packages) section of this repo.

The containers are stored on my gitea instance, so you can pull them like this:

```bash
docker pull gitea.elara.ws/elara6331/golang:latest
```

### Images

- `static`: A base image with just enough files to run static binaries
- `golang`: An alpine-based image with Go installed
- `webserver`: A very simple webserver
- `go-import-redirector`: rsc's [go-import-redirector](https://github.com/rsc/go-import-redirector) project
