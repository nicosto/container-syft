FROM nicosto75/alpine:3.13.2-1

LABEL maintainer="container-maintainer@zremal.org"
LABEL "org.zremal"="ZREMAL Inc."
LABEL version="1.0"
LABEL description="Syft base image based on Alpine"

RUN apk --no-progress --quiet --no-cache add curl \
    && curl -s http://192.168.10.56:9090/syft-0.13.1-1.zremal.x86_64.apk -o ./pkg.apk \
    && apk add --no-progress --quiet --no-cache --allow-untrusted ./pkg.apk \
    && apk del --no-progress --quiet --no-cache curl \
    && rm -f ./pkg.apk

# COPY ./pkg/syft-0.13.1-1.zremal.x86_64.apk /tmp
# RUN apk add --no-cache --allow-untrusted /tmp/syft-0.13.1-1.zremal.x86_64.apk && \
#     adduser syft --disabled-password --no-create-home && \
#     rm -rf /tmp/*

USER user
CMD sleep 3600