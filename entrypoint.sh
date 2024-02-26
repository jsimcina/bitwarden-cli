#!/bin/bash
EXPORT BW_CLIENTID=${BW_CLIENTID}
EXPORT BW_CLIENTSECRET=${BW_CLIENTSECRET}
EXPORT BW_PASSWORD=${BW_PASSWORD}
set -e

bw config server ${BW_HOST}

export BW_SESSION=$(bw login --apikey)

bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection