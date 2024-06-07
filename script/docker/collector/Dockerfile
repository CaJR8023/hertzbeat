FROM openjdk:17-slim-buster

ARG VERSION

MAINTAINER Apache HertzBeat "dev@hertzbeat.apache.org"

# Install SSH
RUN apt-get update && apt-get install -y openssh-server 
RUN mkdir /var/run/sshd

ADD apache-hertzbeat-collector-${VERSION}-incubating-bin.tar.gz /opt/

ENV TZ=Asia/Shanghai
ENV LANG=en_US.UTF-8

WORKDIR /opt/apache-hertzbeat-collector-${VERSION}-incubating-bin/

ENTRYPOINT ["./bin/entrypoint.sh"]
