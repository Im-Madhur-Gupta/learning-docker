#!/bin/bash

echo Enter configuration of image that has to be built \(A or B\) - 
read config

echo Enter version of image -
read version

if [ $config == "A" ]
then
    exec docker build --tag simple-node-app-a:$version --progress=plain -f A.Dockerfile . --secret id=A_secret,src=A_secret.txt
elif [ $config == "B" ]
then
    exec docker build --tag simple-node-app-b:$version --progress=plain -f B.Dockerfile . --secret id=B_secret,src=B_secret.txt
fi