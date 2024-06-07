#!/bin/sh

cd `dirname $0`
# current dir
CURRENT_DIR=`pwd`
# cd dist dir
cd ../../../dist
# auto detect hertzbeat version
VERSION=`ls apache-hertzbeat-collector-*-incubating-bin.tar.gz| awk -F"-" '{print $4}'`
# use the version param
if [ -n "$1" ]; then
    VERSION="$1";
fi

# docker compile context
CONTEXT_DIR=`pwd`

COMMAND="docker buildx build --platform linux/arm64,linux/amd64 -t apache/hertzbeat-collector:v$VERSION -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push"

#COMMAND="docker buildx build --platform linux/arm64,linux/amd64 -t apache/hertzbeat-collector:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION" --push"

# Build Local

#COMMAND="docker build -t apache/hertzbeat-collector:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION""

echo "$COMMAND"

$COMMAND

#docker build -t apache/hertzbeat-collector:latest -f $CURRENT_DIR/Dockerfile $CONTEXT_DIR --build-arg VERSION="$VERSION"
