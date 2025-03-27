#!/bin/sh

export JAVA_HOME=/opt/jdk-11.0.2

export HADOOP_HOME=/opt/hadoop-3.4.1
export HADOOP_COMMON_LIB_NATIVE_DIR="${HADOOP_HOME}/lib/native"
export HADOOP_OPTS="${HADOOP_OPTS} -Djava.library.path=${HADOOP_COMMON_LIB_NATIVE_DIR} -Djava.net.preferIPv4Stack=true"
export HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
export HADOOP_LOG_DIR="${HADOOP_HOME}/logs"
export HADOOP_PID_DIR="${HADOOP_HOME}/pid"
export LD_LIBRARY_PATH=$HADOOP_COMMON_LIB_NATIVE_DIR

export SPARK_HOME=/opt/spark
export SPARK_CONF_DIR="${SPARK_HOME}/conf"
export SPARK_LOG_DIR="${SPARK_HOME}/logs"
export SPARK_PID_DIR="${SPARK_HOME}/pid"

###

echo $PATH | grep "${JAVA_HOME}/bin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${JAVA_HOME}/bin:$PATH"
fi

###

echo $PATH | grep "${HADOOP_HOME}/bin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${HADOOP_HOME}/bin:$PATH"
fi

echo $PATH | grep "${HADOOP_HOME}/sbin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${HADOOP_HOME}/sbin:$PATH"
fi

###

echo $PATH | grep "${SPARK_HOME}/bin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${SPARK_HOME}/bin:$PATH"
fi

echo $PATH | grep "${SPARK_HOME}/sbin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${SPARK_HOME}/sbin:$PATH"
fi
