#!/bin/bash

python3 immich_tiktok_remover.py

curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"immich_url":$IMMICH_URL,"immich_api_key":$IMMICH_API}' \
  http://localhost:5000/stop