#!/bin/bash

secretsFolder=secrets
secretsFile=(kheops_auth_hmasecret kheops_superuser_hmasecret mysql_password mysql_root_password)

if [ ! -d $secretsFolder ]; then
    mkdir $secretsFolder
else
    echo "$secretsFolder already exists"
fi

cd $secretsFolder

for i in "${secretsFile[@]}"
do
    if [ ! -f $i ]; then
        touch $i
    else
        echo "$i already exists"
    fi
done


