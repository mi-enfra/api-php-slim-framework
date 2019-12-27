# Docker-ized PHP project scaffold

## Requirements:
- Expects reverse proxy container (i.e. https://github.com/mi-enfra/reverse-proxy)
- Configured host file

## How to Use:
1. `git clone git@github.com:mi-enfra/api-php-composer.git .`

2. `bash setup.sh`

    - Configures project URL
    - Builds image locally

3. `docker-compose up -d`

## Notes
1. To configure composer packages, `bash composer.sh` takes you inside the dev environment