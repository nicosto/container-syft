FROM alpine:3.19

LABEL maintainer="container-maintainer@zremal.org"
LABEL "org.zremal"="ZREMAL Inc."
LABEL version="1.0"
LABEL description="Syft container image based on Alpine"

RUN apk --no-progress --quiet --no-cache add curl 
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin v0.32.0

ENTRYPOINT ["/usr/local/bin/syft"] 