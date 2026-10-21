#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script with sudo access!"
    exit 1
fi

validate() {
    if [ "$1" -ne 0 ]; then
        echo "$2....failed"
        exit 1
    else
        echo "$2....success"
    fi
}

echo "Proceeding..."

dnf install nginx -y
validate "$?" "Nginx installation"

dnf install mysql -y
validate "$?" "MySQL installation"

echo "Still proceeding..."

# here need to logic need to undestamd ................