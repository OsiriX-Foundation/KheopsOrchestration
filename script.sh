#!/bin/bash


 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Inbox.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Study_List.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_Capability_Tokens.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-proxy_pacs.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Zipper.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Album.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-DICOMweb_proxy.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Capabilities_tokens_albums.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Study_comments.json
 sed -i "s|\"src\": null|\"src\": \"testStudy.dcm\"|" postman/kheops-Viewer_token.json


 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testStudy.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testFelix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testIncisix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testMaceosix.dcm\"/" postman/kheops-Study_List-withOptions.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testMagix.dcm\"/" postman/kheops-Study_List-withOptions.json
 
 
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testStudy.dcm\"/" postman/kheops-series_favorite.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testFelix.dcm\"/" postman/kheops-series_favorite.json
 sed -i "0,/\"src\": null/ s/\"src\": null/\"src\": \"testIncisix.dcm\"/" postman/kheops-series_favorite.json
