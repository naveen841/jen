#!/bin/bash

yum update -y

yum install httpd -y

if [[ $1 -eq 0 ]];
then 
    echo "please check if its has installed"
fi

systemctl start httpd
