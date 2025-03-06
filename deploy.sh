#!/bin/bash
VERSION=${1:-v2}
docker build --pull . -f Dockerfile -t aolifu/webcheck:$VERSION
docker push aolifu/webcheck:$VERSION

docker stop webcheck
docker rm webcheck

docker run -d --restart=unless-stopped --name=webcheck -p 11011:3000 aolifu/webcheck:$VERSION
