# static-root

The [static-root image](https://gitea.elara.ws/Elara6331/-/packages/container/static-root/latest) is a basic image with just enough files to run static binaries. It's meant to be used as a base image and is useless outside of that.

This image will only run static binaries (i.e. Go binaries with `CGO_ENABLED=0`) as it doesn't include musl or glibc

This image runs as root. See [static](https://gitea.elara.ws/Elara6331/riscv-docker/src/branch/master/static) for a rootless container.
