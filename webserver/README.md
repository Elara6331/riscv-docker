# webserver

The [webserver image](https://gitea.elara.ws/Elara6331/-/packages/container/webserver/latest) is a very simple webserver that serves its `/html` directory and logs requests. It doesn't have any TLS capabilities or anything like that, it just serves some static files and does nothing else.

You can change the address it listens on using the `WEBSERVER_ADDR` environment variable.