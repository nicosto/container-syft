#!/usr/bin/env bash

DOCKER_USERNAME=nicosto75
DOCKER_PASSWORD=610f671d-97fd-4c1e-8bd2-eca9692892ed
AUTH=$(echo -n "${DOCKER_USERNAME}:${DOCKER_PASSWORD}" | base64)

# cat << EOF > config.json
# {
#     "auths": {
#         "https://index.docker.io/v1/": {
#             "auth": "${AUTH}"
#         }
#     }
# }
# EOF

docker run \
    -v `pwd`/config.json:/kaniko/.docker/config.json:ro \
    -v `pwd`:/workspace \
    gcr.io/kaniko-project/executor:latest \
    --destination $DOCKER_USERNAME/syft:0.1 \
    --context dir:///workspace/