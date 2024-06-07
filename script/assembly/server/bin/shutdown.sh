#!/bin/bash

APPLICATION="${project.artifactId}"

# jar file name
APPLICATION_JAR="${project.build.finalName}.jar"

# find the service pid, kill -9 pid
PID=$(ps -ef | grep java | grep "${APPLICATION_JAR}" | grep -v grep | awk '{ print $2 }')
if [[ -z "$PID" ]]
then
    echo HertzBeat ${APPLICATION} is already stopped
else
    echo kill  ${PID}
    kill -9 ${PID}
    echo Shutdown HertzBeat ${APPLICATION} Success!
fi