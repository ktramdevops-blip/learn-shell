#!/bin/bash
logs_folder="/var/log/shell-practice"
logs_file="$logs_folder/${0}.log"

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script with sudo access!"
    exit 1
fi
mkdir -p $logs_folder
echo "Script started execution at $(date '+%F %T')" &>>$logs_file

validate() {
    if [ "$1" -ne 0 ]; then
        echo "$2....FAILED" | tee -a logs_file
        exit 1
    else
        echo "$2....SUCCESS" | tee -a logs_file
    fi
}

for package in "$@"
do
dnf installed $package &>>$logs_file
if [$? -ne 0]; then
    echo "going to install ${package}"
    dnf install ${package} -y>>$logs_file
    validate $? "installing ${package}"
else
    echo "${package} is already installed SKIPPING"
fi        

done

#to run this code sudo sh 15-loops.sh nginx mysql
