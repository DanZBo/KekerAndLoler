
if [ -z "$SERVER_NAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: SERVER_NAME or PASSWORD is not set!"
  exit 1
fi

cp ./nginx/nginx_example.conf ./nginx/nginx.conf
sed -i "s/{YOUR_SERVER_NAME}/$SERVER_NAME/g" ./nginx/nginx.conf

cp ./config_example.json ./config.json
sed -i "s/{PASSWORD}/$PASSWORD/g" ./config.json
sed -i "s/{YOUR_SERVER_NAME}/$SERVER_NAME/g" ./config.json

docker-compose up -d --build

echo "Done! Your connection url:
trojan://$PASSWORD@$SERVER_NAME:443?security=tls&sni=$SERVER_NAME&type=tcp#Me"