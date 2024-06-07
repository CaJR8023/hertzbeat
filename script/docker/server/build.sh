#!/bin/sh

cd `dirname $0`
# current dir
CURRENT_DIR=`pwd`
# cd dist dir
# cd ../../../dist
# auto detect hertzbeat version
VERSION=`ls monitoring-*-incubating-bin.tar.gz| awk -F"-" '{print $3}'`
# use the version param
if [ -n "$1" ]; then
    VERSION="$1";
fi

# compile context dir
CONTEXT_DIR=`pwd`

#COMMAND="docker buildx build --platform ${IMAGE_PLATFORM:-linux/arm64,linux/amd64} -t apache/hertzbeat:v$VERSION -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push=${IMAGE_PUSH:-true} --load=${IMAGE_LOAD:-false}"

#COMMAND="docker buildx build --platform linux/arm64,linux/amd64 -t apache/hertzbeat:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push"

#COMMAND="docker buildx build --platform linux/arm64,linux/amd64 -t quay.io/tancloud/hertzbeat:v$VERSION -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push"

#COMMAND="docker buildx build --platform linux/arm64,linux/amd64 -t quay.io/tancloud/hertzbeat:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push"

# Build Local

COMMAND="docker build -t monitoring:v$VERSION -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" "

echo "$COMMAND"

$COMMAND
docker tag monitoring:v$VERSION monitoring

#docker build -t apache/hertzbeat:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION"
