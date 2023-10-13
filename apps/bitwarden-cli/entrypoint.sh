#!/bin/sh

set -e

bw config server "${BW_HOST}"

bw login --apikey --raw

BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)

export BW_SESSION

bw unlock --check

echo 'Running `bw server` on port 8087'

bw serve --hostname 0.0.0.0 #--disable-origin-protection
