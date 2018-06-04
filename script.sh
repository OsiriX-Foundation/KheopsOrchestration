#!/bin/bash

 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops-Study_List.postman_collection.json
