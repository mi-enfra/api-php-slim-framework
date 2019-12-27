#! /bin/bash

create_env () {
    if ! [ -f ".env" ]
    then
        cp "env.example" ".env"
        sed -i -e "s/\(PROJECT_URL=php.example.com\)/PROJECT_URL=$1/g" ".env"
        echo "Created .env file."
    else
        echo ".env already exists, skipping..."
    fi
}

update_conf () {
    if grep -q "php.example.com" site.conf
    then
        sed -i -e "s/\(server_name php.example.com;\)/server_name $1;/g" "site.conf"
        echo "Updated site.conf file."
    else
        echo "Project URL already setup, skipping..."
    fi
}

# Will only run if .env file is not yet created
# -OR- site.conf contains php.example.com as server_name
if ! [ -f ".env" ] || grep -q "php.example.com" site.conf
then
    echo "Project URL (e.g. php.example.com):"
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