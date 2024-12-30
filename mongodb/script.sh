echo "Starting setup MongoDB"

docker-compose up -d

docker exec shard01-a sh -c "mongosh < /scripts/shard01.js"
docker exec shard02-a sh -c "mongosh < /scripts/shard02.js"
docker exec shard03-a sh -c "mongosh < /scripts/shard03.js"

sleep 1

docker exec config-server sh -c "mongosh < /scripts/config-server.js"

sleep 2

docker exec router sh -c "mongosh < /scripts/router.js"
docker exec router mongosh --port 27017

echo "MongoDB is ready to use"
