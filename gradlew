#!/bin/bash

        PRG="$0"
while [ -h "$PRG" ]; do
ls=$(ls -ld "$PRG")
link=$(expr "$ls" : '.*-> \(.*\)$')
if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
else
PRG=$(dirname "$PRG")"/$link"
fi
        done

APP_HOME="$(cd "$(dirname "$PRG")" && pwd)"
APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Default JVM options
DEFAULT_JVM_OPTS='-Xmx64m -Xms64m'

# Determine the Java command to use to start the JVM
if [ -n "$JAVA_HOME" ]; then
        JAVACMD="$JAVA_HOME/bin/java"
else
JAVACMD="java"
fi

# Increase the maximum file descriptors if possible
if [ "$darwin" != "true" ] && [ "$nonstop" != "true" ]; then
        MAX_FD_LIMIT=$(ulimit -H -n)
if [ $? -eq 0 ]; then
        ulimit -n "$MAX_FD_LIMIT"
fi
        fi

# For Darwin, add options to specify how the application appears in the dock
if [ "$darwin" = "true" ]; then
        GRADLE_OPTS="$GRADLE_OPTS -Xdock:name=$APP_NAME -Xdock:icon=$APP_HOME/media/gradle.icns"
fi

# For Cygwin or MSYS, switch paths to Windows format before running java
if [ "$cygwin" = "true" -o "$msys" = "true" ]; then
        APP_HOME=$(cygpath --path --mixed "$APP_HOME")
CLASSPATH=$(cygpath --path --mixed "$APP_HOME/gradle/wrapper/gradle-wrapper.jar")
JAVACMD=$(cygpath --unix "$JAVACMD")
fi

# Escape application arguments
save() {
    printf '%s\n' "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/"
}

APP_ARGS=$(save "$@")

# Collect all arguments for the java command
set -- "$DEFAULT_JVM_OPTS" "$JAVA_OPTS" "$GRADLE_OPTS" "-Dorg.gradle.appname=$APP_BASE_NAME" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$APP_ARGS"

# Execute the java command
exec "$JAVACMD" "$@"
