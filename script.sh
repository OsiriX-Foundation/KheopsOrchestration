 #!/bin/bash
 
sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops.postman_collection.json
  
cd kheops
#docker-compose up -d
cd ..
docker ps -a
#sleep 30
cat kheops.postman_collection.json
#node_modules/.bin/newman run bitcoinz.postman_collection.json -e tests.postman_environment.json
#node_modules/.bin/newman run kheops.postman_collection.json -e kheops_localhost.postman_environment.json -g Workspace.postman_globals.json
#node_modules/.bin/newman run kheops.postman_collection.json -e kheops_test.kheops.online.postman_environment.json -g Workspace.postman_globals.json
