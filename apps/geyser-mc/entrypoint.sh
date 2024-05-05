#!/bin/bash

mkdir -p "${GEYSER_HOME}/"{extensions,}

# Link embedded extensions
find "/opt/geyser/extensions/" -mindepth 1 -maxdepth 1 \
  -exec ln -sv "{}" "$GEYSER_HOME/extensions/" ";"

cd "$GEYSER_HOME" || exit

exec /usr/bin/java \
  -Xms${GEYSER_MIN_MEM:-1G} \
  -Xmx${GEYSER_MAX_MEM:-2G} \
  -jar /opt/geyser/Geyser-Standalone.jar --nogui
