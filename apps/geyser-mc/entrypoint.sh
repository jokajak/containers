#!/bin/bash

GEYSER_HOME_TEMPLATE="$GEYSER_HOME"

rm -rf /tmp/geyser-home.*
GEYSER_HOME="$(mktemp -p /tmp -d geyser-home.XXXXXXXXXX)"
mkdir -p "$GEYSER_HOME/"{extensions,}

# Link embedded extensions
find "/opt/geyser/extensions/" -mindepth 1 -maxdepth 1 \
  -exec ln -sv "{}" "$GEYSER_HOME/extensions/" ";"

# link any files from the geyser home template
if [ -e "$GEYSER_HOME_TEMPLATE" ]; then

  # Create links for any extensions provided in the template GEYSER_HOME
  find "$GEYSER_HOME_TEMPLATE/extensions" -mindepth 1 -maxdepth 1 \
    -exec ln -sv "{}" "$GEYSER_HOME/extensions/" ";"

  # Create links for all other files directly within the template
  # GEYSER_HOME
  find "$GEYSER_HOME_TEMPLATE" -mindepth 1 -maxdepth 1 \
    -name config.yml -o -name extensions -prune \
    -o -exec ln -sv "{}" "$GEYSER_HOME/" ";"
fi

cd "$GEYSER_HOME" || exit

exec /usr/bin/java \
  -Xms${GEYSER_MIN_MEM:-1G} \
  -Xmx${GEYSER_MAX_MEM:-2G} \
  -jar /opt/geyser/Geyser-Standalone.jar --nogui
