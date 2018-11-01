#!/bin/bash

 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Inbox.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Study_List.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_Capability_Tokens.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-proxy_pacs.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Zipper.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Album.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_proxy.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops-Capabilities_tokens_albums.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" postman/kheops_Capabilities_tokens_Delete.postman_collection.json
 



 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testStudy.dcm\"/" postman/kheops-Study_List-withOptions.postman_collection.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testFelix.dcm\"/" postman/kheops-Study_List-withOptions.postman_collection.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testIncisix.dcm\"/" postman/kheops-Study_List-withOptions.postman_collection.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testMaceosix.dcm\"/" postman/kheops-Study_List-withOptions.postman_collection.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testMagix.dcm\"/" postman/kheops-Study_List-withOptions.postman_collection.json
