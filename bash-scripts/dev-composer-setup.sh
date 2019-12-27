docker-compose up -d php
docker-compose exec php sh -c "
    composer install
"
docker-compose down