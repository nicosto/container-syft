FROM alpine:3.13.1

RUN wget -qO- https://github.com/anchore/syft/releases/download/v0.12.5/syft_0.12.5_linux_amd64.tar.gz | tar --directory /usr/local/bin -zxf - syft && \
    adduser syft --disabled-password --no-create-home

USER syft
CMD sleep 3600