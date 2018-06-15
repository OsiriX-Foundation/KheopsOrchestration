#!/bin/bash

cd kheops
docker-compose up -d
cd ..
sleep 45
docker ps -a
