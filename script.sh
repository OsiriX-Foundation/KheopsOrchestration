#!/bin/bash

 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Inbox.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Study_List.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_Capability_Tokens.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-proxy_pacs.postman_collection.json

