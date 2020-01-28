#!/bin/bash

if [ ! -x "$(command -v docker)" ];
then
  echo "You must install docker"
  echo "https://docs.docker.com/install/"
  exit 1
fi

if [ ! -x "$(command -v docker-compose)" ];
then
  echo "You must install docker-compose"
  echo "https://docs.docker.com/compose/install/"
  exit 1
fi

secretpath="kheops/secrets/"
kheopspath="kheops/"

echo "Download project docker"
if [[ ! -d "$kheopspath" ]]
then
  mkdir $kheopspath
  (cd $kheopspath && curl https://raw.githubusercontent.com/OsiriX-Foundation/kheopsDocker/install/kheops/.env --output .env --silent)
  (cd $kheopspath && curl https://raw.githubusercontent.com/OsiriX-Foundation/kheopsDocker/install/kheops/docker-compose.env --output docker-compose.env --silent)
  (cd $kheopspath && curl https://raw.githubusercontent.com/OsiriX-Foundation/kheopsDocker/install/kheops/docker-compose.yml --output docker-compose.yml --silent)
fi

echo "Generate secrets"
if [[ ! -d "$secretpath" ]]
then
  mkdir $secretpath
fi

secretfiles=("kheops_auth_hmasecret" "kheops_auth_hmasecret_post" \
  "kheops_client_dicomwebproxysecret" "kheops_client_zippersecret" \
  "kheops_metric_ressource_password" "kheops_superuser_hmasecret" \
  "keycloak_psql_password" "kheops_pacsdb_pass" "kheops_authdb_pass")

echo "Enter the Keycloak administrator password (user: admin):"
read KEYCLOAK_ADMIN_PASSWORD
echo $KEYCLOAK_ADMIN_PASSWORD > ${secretpath}keycloak_admin_password

docker pull frapsoft/openssl
docker pull andyneff/uuidgen
for secretfile in ${secretfiles[*]}
do
  secret=$(docker run -it frapsoft/openssl rand -base64 32)
  echo $secret > ${secretpath}tmp_${secretfile}
  sed -e "s/\r//g" ${secretpath}tmp_${secretfile} > $secretpath$secretfile
  rm ${secretpath}tmp_${secretfile}
done

keycloakclientsecret=$(docker run -it andyneff/uuidgen)
echo $keycloakclientsecret > ${secretpath}tmp_kheops_keycloak_clientsecret
sed -e "s/\r//g" ${secretpath}tmp_kheops_keycloak_clientsecret > ${secretpath}kheops_keycloak_clientsecret
rm ${secretpath}tmp_kheops_keycloak_clientsecret

docker rm $(docker ps -a -q)
docker rmi frapsoft/openssl
docker rmi andyneff/uuidgen

(cd $kheopspath && docker-compose down -v && docker-compose pull)
(cd $kheopspath && docker-compose up -d keycloak)
while true; do
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

docker exec keycloak /keycloakconfiguration.sh

(cd $kheopspath && docker-compose up)
