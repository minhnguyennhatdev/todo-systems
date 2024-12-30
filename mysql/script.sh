# check .env file exists
if [ ! -f .env ]; then
    echo "Please create .env file"
    exit 1
fi

echo "Starting setup MySQL"

docker compose up -d

echo "MySQL is ready to use"