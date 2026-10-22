#!/bin/bash
logs_folder="/var/log/shell-practice"
logs_file="$logs_folder/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m" 

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run the script with sudo access!"
    exit 1
fi
mkdir -p $logs_folder
echo "Script started execution at $(date '+%F %T')" &>>$logs_file

validate() {
    if [ "$1" -ne 0 ]; then
        echo -e "$2....${R}FAILED" ${N} | tee -a logs_file
        exit 1
    else
        echo -e "$2....${G}SUCCESS"${N} | tee -a logs_file
    fi
}

for package in "$@"
do
    dnf list installed "$package" &>> "$logs_file"

    if [ $? -ne 0 ]; then
        echo "Going to install ${package}"

        dnf install "$package" -y &>> "$logs_file"
        validate $? "Installing ${package}"
    else
        echo -e "${package} is already installed. ${Y}SKIPPING${N}"
    fi
done

#to run this code sudo sh 15-loops.sh nginx mysql
