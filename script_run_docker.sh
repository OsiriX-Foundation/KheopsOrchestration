#!/bin/bash

cd kheops
docker-compose down -v
docker-compose up -d
cd ..
sleep 45
docker ps -a
