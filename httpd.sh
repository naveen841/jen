#!/bin/bash

sudo yum update -y

sudo yum install httpd -y

if [[ $1 -eq 0 ]];
then 
    echo "please check if its has installed"
fi

sudo systemctl start httpd
