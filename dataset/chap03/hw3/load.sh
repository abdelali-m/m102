#!/bin/bash

# mongoimport --drop -d pcat -c products products.json
mongoimport --host storage --port 27017 -u adminmaster -p passmaster --authenticationDatabase admin --drop --db pcat --collection products --file products.json
