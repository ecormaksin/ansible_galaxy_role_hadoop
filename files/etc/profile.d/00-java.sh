#!/usr/bin/env bash

export JAVA_HOME=/opt/jdk-11.0.2

echo $PATH | grep "${JAVA_HOME}/bin" >/dev/null
if [ $? -ne 0 ]; then
    PATH="${JAVA_HOME}/bin:$PATH"
fi
