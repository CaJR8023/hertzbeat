#!/bin/sh

# project name
SERVER_NAME="${project.build.finalName}"

# jar name
JAR_NAME="${project.build.finalName}.jar"

# cd bin
cd `dirname $0`
# bin dir
BIN_DIR=`pwd`
# return root
cd ..
# root path dir
DEPLOY_DIR=`pwd`

# config dir
# absolute directory of external configuration files, if it is a directory, it should end with '/'，you can also directly specify a file.
# if a directory is specified, spring will read all configuration files in the directory
CONF_DIR=$DEPLOY_DIR/config
MAIN_CLASS="org.apache.hertzbeat.manager.Manager"
EXT_LIB_PATH="$DEPLOY_DIR/ext-lib"
CLASSPATH="$DEPLOY_DIR/$JAR_NAME:$EXT_LIB_PATH/*"
# log dir
LOGS_DIR=$DEPLOY_DIR/logs
# create logs dir when not exist
if [ ! -d $LOGS_DIR ]; then
    mkdir $LOGS_DIR
fi

# JVM Configuration
JAVA_OPTS=" -Doracle.jdbc.timezoneAsRegion=false"

# JVM Configuration
JAVA_MEM_OPTS=" -server -XX:SurvivorRatio=6 -XX:+UseParallelGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$LOGS_DIR"

# load logback config
LOG_IMPL_FILE=logback-spring.xml
LOGGING_CONFIG=""
if [ -f "$CONF_DIR/$LOG_IMPL_FILE" ]
then
    LOGGING_CONFIG="-Dlogging.config=$CONF_DIR/$LOG_IMPL_FILE"
fi
CONFIG_FILES=" -Dlogging.path=$LOGS_DIR $LOGGING_CONFIG -Dspring.config.location=$CONF_DIR/ "
echo -e "Starting the HertzBeat $SERVER_NAME ..."
java $JAVA_OPTS $JAVA_MEM_OPTS $CONFIG_FILES -cp $CLASSPATH $MAIN_CLASS --spring.profiles.active=prod
