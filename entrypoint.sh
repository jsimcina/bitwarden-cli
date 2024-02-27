#!/bin/bash

set -e

export BW_CLIENTID=${BW_CLIENTID}
export BW_CLIENTSECRET=${BW_CLIENTSECRET}
export BW_PASSWORD=${BW_PASSWORD}

bw config server ${BW_HOST}

export BW_SESSION=$(bw login --apikey --passwordenv BW_PASSWORD)
export BW_SESSION=$(bw unlock --passwordenv BW_PASSWORD --raw)
bw unlock --check

echo 'Running `bw server` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection