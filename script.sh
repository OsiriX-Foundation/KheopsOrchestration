#!/bin/bash

 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Inbox.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Study_List.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_Capability_Tokens.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-proxy_pacs.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Zipper.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Album.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_proxy.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Capabilities_tokens_albums.json
 sed -i "s|{\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops_Capabilities_tokens_Delete.json
 



 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testStudy.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testFelix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testIncisix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testMaceosix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/ s/\"file\": {}/\"file\": \"testMagix.dcm\"/" postman/kheops-Study_List-withOptions.json
