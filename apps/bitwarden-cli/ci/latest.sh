#!/usr/bin/env bash
patch=2
version=$(curl -sX GET "https://api.github.com/repos/bitwarden/clients/releases" | jq --raw-output 'map(select(.prerelease == false and .draft == false and (.tag_name | startswith("cli-")))) | sort_by(.tag_name) | .[-1].tag_name' 2>/dev/null)
version="${version#*v}"
printf "%s" "${version}-${patch}"
