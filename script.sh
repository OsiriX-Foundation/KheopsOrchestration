#!/bin/bash


 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Inbox.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Study_List.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-DICOMweb_Capability_Tokens.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-proxy_pacs.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Zipper.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-DICOMweb_proxy.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Capabilities_tokens_albums.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Study_comments.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Viewer_token.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops_Capabilities_tokens_Delete.json
 sed -i "s|\"file\": {}|\"file\": {\"src\": \"testStudy.dcm\"}|" postman/kheops-Introspect.json

 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testStudy.dcm\"}/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testFelix.dcm\"}/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testIncisix.dcm\"}/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testMaceosix.dcm\"}/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testMagix.dcm\"}/" postman/kheops-Study_List-withOptions.json

 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testStudy.dcm\"}/" postman/kheops-Album.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testFelix.dcm\"}/" postman/kheops-Album.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testIncisix.dcm\"}/" postman/kheops-Album.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testMaceosix.dcm\"}/" postman/kheops-Album.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testMagix.dcm\"}/" postman/kheops-Album.json
 
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testStudy.dcm\"}/" postman/kheops-series_favorite.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testFelix.dcm\"}/" postman/kheops-series_favorite.json
 sed -i "0,/\"file\": {}/s//\"file\": {\"src\": \"testIncisix.dcm\"}/" postman/kheops-series_favorite.json
