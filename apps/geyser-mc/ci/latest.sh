#!/usr/bin/env bash
patch=1

# Perform a HEAD request to get headers only
url="https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone"
response=$(curl -sI $url)

# Extract the Location header and parse the version number
version=$(echo "$response" | grep -i Location | sed -E 's|.*versions/([0-9]+\.[0-9]+\.[0-9]+).*|\1|')
printf "%s" "${version}-${patch}"
