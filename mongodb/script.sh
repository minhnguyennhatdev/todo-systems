echo "Starting setup MongoDB"

docker exec shard-01-node-a sh -c "mongosh < /scripts/init-shard01.js"
docker exec shard-02-node-a sh -c "mongosh < /scripts/init-shard02.js"
docker exec shard-03-node-a sh -c "mongosh < /scripts/init-shard03.js"

sleep 1

docker exec mongo-config-01 sh -c "mongosh < /scripts/init-configserver.js"

sleep 2

docker exec router-01 sh -c "mongosh < /scripts/init-router.js"

docker exec router-01 mongosh --port 27017

echo "MongoDB is ready to use"


mongodb://mongodb://127.0.0.1:27117,127.0.0.1:27118/demo?retryWrites=true&w=majority&appName=demo