#!/bin/bash

 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops-Inbox.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops-Study_List.postman_collection.json
 sed -i "s|\"file\": {}|\"file\": \"testStudy.dcm\"|" kheops-DICOMweb_Capability_Tokens.postman_collection.json
