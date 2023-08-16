# riscv-docker

[![status-badge](https://ci.elara.ws/api/badges/51/status.svg)](https://ci.elara.ws/repos/51)

This repo contains custom docker images that I'm using for my cluster. You can find the containers I build from these in the [Packages](https://gitea.elara.ws/Elara6331/riscv-docker/packages) section of this repo.

The containers are stored on my gitea instance, so you can pull them like this:

```bash
docker pull gitea.elara.ws/elara6331/golang:latest
```

### Images

- `static`: A base image with just enough files to run static binaries
- `busybox`: A base image with the busybox utilities installed
- `golang`: An alpine-based image with Go installed
- `webserver`: A very simple webserver
- `go-import-redirector`: rsc's [go-import-redirector](https://github.com/rsc/go-import-redirector) project
- `node`: An alpine-based image with NodeJS and npm installed
- `crane`: Google's [crane](https://github.com/google/go-containerregistry/tree/main/cmd/crane) project

### Acknowledgements

- [Alpine Linux](https://alpinelinux.org/): The basis of all my images
- [ko](https://ko.build/): Used to build light containers with static Go programs
- [apko](https://github.com/chainguard-dev/apko): Used to build more complex containers
