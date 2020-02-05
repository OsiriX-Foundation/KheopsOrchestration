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

echo "Downloading resources"
if [[ ! -d "$kheopspath" ]]
then
  mkdir $kheopspath
  (cd $kheopspath && curl ${downloadURI}/docker/.env --output .env --silent -H 'Cache-Control: no-cache')
  (cd $kheopspath && curl ${downloadURI}/docker/docker-compose.env --output docker-compose.env --silent -H 'Cache-Control: no-cache')
  (cd $kheopspath && curl ${downloadURI}/docker/docker-compose.yml --output docker-compose.yml --silent -H 'Cache-Control: no-cache')
  (cd $kheopspath && curl ${downloadURI}/themes/kheops.tar.gz --silent  -H 'Cache-Control: no-cache' | tar -xzC kheops)
fi

if [[ ! -d "$realmpath" ]]
then
  mkdir $realmpath
  (cd $realmpath && curl ${downloadURI}/realm/kheops-realm.json --output kheops-realm.json --silent)
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

echo "Enter a password for the Keycloak administrator (user: admin):"
read KEYCLOAK_ADMIN_PASSWORD
printf "%s\n" $(printf "%s" $KEYCLOAK_ADMIN_PASSWORD | tr -dc '[:print:]') > ${secretpath}keycloak_admin_password

docker pull frapsoft/openssl
for secretfile in ${secretfiles[*]}
do
  printf "%s\n" $(docker run --rm frapsoft/openssl rand -base64 32 | tr -dc '[:print:]') > $secretpath$secretfile
done

(cd $kheopspath && docker-compose down -v && docker-compose pull)
(cd $kheopspath && docker-compose up -d keycloak)

echo "Waiting for Keycloak to startup:"
while true; do
  printf '.'
  status_code=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "http://localhost:8080/auth/")
  if [ $status_code = 500 ]
  then
    echo "Keycloak error"
  elif [ $status_code != 000 ]
  then
    break;
  fi
  sleep 1
done
printf '\n'

echo "Setting up the KHEOPS Service Account in Keycloak:"

echo "Regenerating the kheopsAuthorization client secret:"
docker exec keycloak /opt/jboss/keycloak/bin/kcadm.sh create clients/efa56c67-85d8-4472-958a-f238bf4cc803/client-secret \
           -r kheops \
          --no-config \
          --server http://localhost:8080/auth \
          --realm master \
          --user admin \
          --password $(cat ${secretpath}keycloak_admin_password | tr -dc '[:print:]' ) 2> /dev/null

echo "Retrieving the kheopsAuthorization client secret:"
printf "%s\n" $(docker exec keycloak /opt/jboss/keycloak/bin/kcadm.sh get clients/efa56c67-85d8-4472-958a-f238bf4cc803/client-secret \
          -r kheops \
          --no-config \
          --server http://localhost:8080/auth \
          --realm master \
          --user admin \
          --password $(cat ${secretpath}keycloak_admin_password | tr -dc '[:print:]' ) \
          --fields value 2> /dev/null \
            | grep -o '"value" : *"[^"]*"' | grep -o '"[^"]*"$' | tr -d '"') > ${secretpath}kheops_keycloak_clientsecret 

echo "Adding the view-users role to the kheopsAuthorization serivice account:"
docker exec keycloak /opt/jboss/keycloak/bin/kcadm.sh add-roles \
  -r kheops \
  --no-config \
  --server http://localhost:8080/auth \
  --realm master \
  --user admin \
  --password $(cat ${secretpath}keycloak_admin_password | tr -dc '[:print:]' ) \
  --uusername service-account-kheopsauthorization \
  --cclientid realm-management \
  --rolename view-users 2> /dev/null

echo "Removing unused roles from the kheopsAuthorization serivice account:"
docker exec keycloak /opt/jboss/keycloak/bin/kcadm.sh remove-roles \
   -r kheops \
  --no-config \
  --server http://localhost:8080/auth \
  --realm master \
  --user admin \
  --password $(cat ${secretpath}keycloak_admin_password | tr -dc '[:print:]' ) \
  --uusername service-account-kheopsauthorization \
  --rolename offline_access \
  --rolename uma_authorization 2> /dev/null

echo "To launch KHEOPS run the following commands"
echo "cd kheops; docker-compose up"
