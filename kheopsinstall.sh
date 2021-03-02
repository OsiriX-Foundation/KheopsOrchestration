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

download_branch="insecure-install-kibana"
downloadURI="https://raw.githubusercontent.com/OsiriX-Foundation/KheopsOrchestration/$download_branch"

secretpath="kheops/secrets"
kheopspath="kheops"
realmpath="kheops/realm"
themespath="kheops/themes"

while [ -z $KEYCLOAK_ADMIN_PASSWORD ]
do
  echo "Enter a password to be set for the Keycloak administrator account"
  echo "(username will be admin):"
  read KEYCLOAK_ADMIN_PASSWORD
done

while [ -z $KIBANA_UI_PASSWORD ]
do
  echo "Enter a password to be set for the Kibana user interface"
  echo "(username will be kheops):"
  read KIBANA_UI_PASSWORD
done

docker run --rm -ti xmartlabs/htpasswd kheops $KIBANA_UI_PASSWORD > auth_basic

echo "Downloading resources"
if [ ! -d "$kheopspath" ]
then
  mkdir $kheopspath
  curl $downloadURI/docker/docker-compose.env --output $kheopspath/docker-compose.env --silent
  curl $downloadURI/docker/docker-compose.yml --output $kheopspath/docker-compose.yml --silent
fi

if [ ! -d "$themespath" ]
then
  mkdir $themespath
  curl $downloadURI/themes/kheops.tar.gz --silent | tar -xzC $themespath
fi

echo "Downloading realm"
if [[ ! -d "$realmpath" ]]
then
  mkdir $realmpath
  curl -sL "$downloadURI/realm/kheops-realm.json" > "$realmpath/kheops-realm.json"
fi

echo "Generating secrets"
if [ ! -d "$secretpath" ]
then
  mkdir $secretpath
fi

secretfiles=("kheops_auth_hmasecret" "kheops_auth_hmasecret_post" \
  "kheops_client_dicomwebproxysecret" "kheops_client_zippersecret" \
  "kheops_pacsdb_pass" "kheops_authdb_pass")

printf "%s\n" $(printf "%s" $KEYCLOAK_ADMIN_PASSWORD | tr -dc '[:print:]') > $secretpath/keycloak_admin_password

docker pull osirixfoundation/openssl

for secretfile in ${secretfiles[*]}
do
  printf "%s\n" $(docker run --rm osirixfoundation/openssl rand -base64 32 | tr -dc '[:print:]') > $secretpath/$secretfile
done

mv auth_basic kheops/secrets

echo ""
echo "To launch KHEOPS run the following commands"
echo "cd kheops; docker-compose pull; docker-compose up -d"
echo ""
echo "Keycloak will be available at http://127.0.0.1:8080"
echo "KHEOPS will be available at http://127.0.0.1"
echo "Kibana will be available at http://127.0.0.1/kibana"
