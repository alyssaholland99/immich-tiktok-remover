mkdir tmp
cp ./testing/docker/templates/env-template tmp/.env
cp -r ./testing/docker/templates/library tmp/library
cp -r ./testing/docker/templates/postgres tmp/postgres

cp /etc/localtime tmp/time

cd tmp

wget -O docker-compose.yml https://github.com/immich-app/immich/releases/latest/download/docker-compose.yml

sed -i -e 's/-\ \/etc\/localtime/\-\ .\/time/g' docker-compose.yml

docker compose up -d

sleep 10