#!/bin/bash

logs_folder="/var/log/shell-practice"
logs_file="$(log_folder)/${0}.log"


if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script with sudo access!"
    exit 1
fi
mkdir -p $logs_folder
echo "Script started execution at ${data + %F %T}"
validate() {
    if [ "$1" -ne 0 ]; then
        echo "$2....FAILED" | tee -a logs_file
        exit 1
    else
        echo "$2....SUCCESS" | tee -a logs_file
    fi
}

echo "Proceeding..."


dnf install nginx -y &>>$logs_file
# here u get out put right u need to print screen or not it hug 
#and clumgy right so no need  
validate "$?" "Nginx installation"

dnf install mysql -y &>>$logs_file
validate "$?" "MySQL installation"
echo "Script  execution complected at ${data + %F %T}"

echo "Still proceeding..."