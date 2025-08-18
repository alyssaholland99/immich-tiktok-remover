#!/bin/bash

read -p "These tests should not be run in a live environment where you have Immich running. Continue? (Y/N) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo cp docker-compose.yml docker-compose-backup.yml
    sudo ./testing/docker/setup_time.sh
    sudo ./testing/docker/setup_compose.sh
    sudo ./testing/docker/restore_db.sh
    sudo ./testing/docker/setup_videos.sh
    sudo ./testing/docker/run_tiktok_remover.sh
    sudo ./testing/docker/check_itr_output.sh
    sudo mv docker-compose-backup.yml docker-compose.yml
    sudo ./testing/docker/cleanup.sh 2>/dev/null
fi