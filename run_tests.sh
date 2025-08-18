#!/bin/bash

sudo
sudo cp docker-compose.yml docker-compose-backup.yml
sudo ./testing/docker/setup_time.sh
sudo ./testing/docker/setup_compose.sh
sudo ./testing/docker/restore_db.sh
sudo ./testing/docker/setup_videos.sh
sudo ./testing/docker/run_tiktok_remover.sh
sudo ./testing/docker/check_itr_output.sh
sudo mv docker-compose-backup.yml docker-compose.yml
sudo ./testing/docker/cleanup.sh 2>/dev/null 