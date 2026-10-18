
#!/bin/bash
# i have the doubt doubt in this program  

# Check whether the user is root
user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

# Install Nginx
echo "Proceeding..."

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Nginx installation is failed"
    exit 1
else
    echo "Nginx installation is success"
fi

# Install MySQL client
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "MySQL client installation is failed"
    exit 1
else
    echo "MySQL client installation is success"
fi

# Final message
echo "Still proceeded..."
