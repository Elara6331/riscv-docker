# crane

The [crane](https://gitea.elara.ws/Elara6331/-/packages/container/crane/latest) image contains Google's [crane](https://github.com/google/go-containerregistry/tree/main/cmd/crane) project. It comes with `/bin/sh` unlike Google's official image, so it's useful for programs such as Woodpecker CI, which depend on a shell being available.
