mkdir tmp
cd tmp

wget -O docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml

cp ../testing/docker/templates/.env .

systemctl start docker

docker compose up