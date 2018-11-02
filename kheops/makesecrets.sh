#!/bin/bash

secretsFolder=secrets
secretsFile=(kheops_auth_hmasecret kheops_auth_hmasecret_post kheops_superuser_hmasecret mysql_password psql_root_password OAuth2_secret)

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
