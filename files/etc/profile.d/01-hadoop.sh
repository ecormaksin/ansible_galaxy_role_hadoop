#!/usr/bin/env bash

export HADOOP_HOME=/opt/hadoop-3.4.1
export PDSH_RCMD_TYPE=ssh

echo $PATH | grep "${HADOOP_HOME}/bin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${HADOOP_HOME}/bin:$PATH"
fi

echo $PATH | grep "${HADOOP_HOME}/sbin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${HADOOP_HOME}/sbin:$PATH"
fi

export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true -Dsun.security.krb5.debug=true -Dsun.security.spnego.debug"

export HDFS_DATANODE_SECURE_USER=hdfs

export HDFS_NFS3_SECURE_USER=nfsserver

export HDFS_NAMENODE_USER=hdfs

export HADOOP_REGISTRYDNS_SECURE_USER=yarn
