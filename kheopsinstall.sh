#!/bin/bash

if [ ! -x "$(command -v docker)" ];
then
  echo "Docker must be installed"
  echo "https://docs.docker.com/install/"
  exit 1
fi

if [ ! -x "$(command -v docker-compose)" ];
then
  echo "Docker Compose must be installed"
  echo "https://docs.docker.com/compose/install/"
  exit 1
fi

downloadURI="https://raw.githubusercontent.com/spalte/kheopsDocker/installkeycloak"

secretpath="kheops/secrets/"
kheopspath="kheops/"
realmpath="kheops/realm"
themespath="kheops/themes"

echo "Downloading resources"
if [[ ! -d "$kheopspath" ]]
then
  mkdir $kheopspath
  curl ${downloadURI}/docker/.env --output ${kheopspath}/.env --silent
  curl ${downloadURI}/docker/docker-compose.env --output ${kheopspath}/docker-compose.env --silent
  curl ${downloadURI}/docker/docker-compose.yml --output ${kheopspath}/docker-compose.yml --silent
fi

if [[ ! -d "$themespath" ]]
then
  mkdir $themespath
  curl ${downloadURI}/themes/kheops.tar.gz --silent | tar -xzC $themespath
fi

echo "Generating secrets"
if [[ ! -d "$secretpath" ]]
then
  mkdir $secretpath
fi

secretfiles=("kheops_auth_hmasecret" "kheops_auth_hmasecret_post" \
  "kheops_client_dicomwebproxysecret" "kheops_client_zippersecret" \
  "kheops_metric_ressource_password" \
  "keycloak_psql_password" "kheops_pacsdb_pass" "kheops_authdb_pass")

echo "Enter a password to be set for the Keycloak administrator account (username: admin):"
read KEYCLOAK_ADMIN_PASSWORD
printf "%s\n" $(printf "%s" $KEYCLOAK_ADMIN_PASSWORD | tr -dc '[:print:]') > ${secretpath}keycloak_admin_password

docker pull frapsoft/openssl
docker pull andyneff/uuidgen

for secretfile in ${secretfiles[*]}
do
  printf "%s\n" $(docker run --rm frapsoft/openssl rand -base64 32 | tr -dc '[:print:]') > $secretpath$secretfile
done

printf "%s\n" $(docker run -it andyneff/uuidgen | tr -dc '[:print:]') > ${secretpath}kheops_keycloak_clientsecret

echo "Downloading realm"
if [[ ! -d "$realmpath" ]]
then
  mkdir $realmpath
  curl ${downloadURI}/realm/kheops-realm.json --silent | \
    sed "s|\${CLIENT_SECRET}|$(cat ${secretpath}kheops_keycloak_clientsecret | tr -dc '[:print:]')|" > ${realmpath}/kheops-realm.json
fi

echo ""
echo "To launch KHEOPS run the following commands"
echo "cd kheops; docker-compose up"
