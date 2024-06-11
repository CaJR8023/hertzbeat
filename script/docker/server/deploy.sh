#!/bin/sh
cd `dirname $0`
# current dir
CURRENT_DIR=`pwd`
# cd dist dir
# auto detect version
VERSION=`ls monitoring-*-incubating-bin.tar.gz| awk -F"-" '{print $3}'`
# use the version param
if [ -n "$1" ]; then
    VERSION="$1";
fi
WORKDIR="/opt/monitoring-$VERSION-incubating-bin"

docker stop monitoring
docker rm monitoring
docker run -p 1157:1157 -p 1158:1158 \
      -e LANG=zh_CN.UTF-8 \
      -e TZ=Asia/Shanghai \
      -e HOSTNAME=monitoring \
      -v $(pwd)/logs:$WORKDIR/logs \
      -v $(pwd)/application.yml:$WORKDIR/config/application.yml \
      -v $(pwd)/sureness.yml:$WORKDIR/config/sureness.yml \
      --restart=always \
      --name monitoring \
      -d monitoring:v$VERSION
docker logs -f monitoring --tail 100

