#!/bin/bash
export BW_CLIENTID=${BW_CLIENTID}
export BW_CLIENTSECRET=${BW_CLIENTSECRET}
export BW_PASSWORD=${BW_PASSWORD}
set -e

bw config server ${BW_HOST}

export BW_SESSION=$(bw login --apikey)

bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection