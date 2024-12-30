# check .env file exists
if [ ! -f .env ]; then
    echo "Please create .env file"
    exit 1
fi

echo "Starting setup Redis"

docker compose up -d

echo "Redis is ready to use"