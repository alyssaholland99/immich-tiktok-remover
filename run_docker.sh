#!/bin/bash

while true
do 
    python3 immich_tiktok_remover.py --avoid-image-recognition
    sleep $RESTART_TIMEOUT
done