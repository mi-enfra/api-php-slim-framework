#! /bin/bash

BASE_URL="slim.example.com"

create_env () {
    if ! [ -f ".env" ]
    then
        cp "env.example" ".env"
        sed -i -e "s/\(PROJECT_URL=$BASE_URL\)/PROJECT_URL=$1/g" ".env"
        echo "Created .env file."
    else
        echo ".env already exists, skipping..."
    fi
}

update_conf () {
    if grep -q "$BASE_URL" site.conf
    then
        sed -i -e "s/\(server_name $BASE_URL;\)/server_name $1;/g" "site.conf"
        echo "Updated site.conf file."
    else
        echo "Project URL already setup, skipping..."
    fi
}

# Will only run if .env file is not yet created
# -OR- site.conf contains $BASE_URL as server_name
if ! [ -f ".env" ] || grep -q "$BASE_URL" site.conf
then
    echo "Project URL (e.g. $BASE_URL):"
    read url
    create_env $url
    sleep 1
    update_conf $url
    sleep 1
    echo "Project setup. Terminating..."
    sleep 1
else
    echo "Project already setup. Terminating..."
    sleep 1
fi