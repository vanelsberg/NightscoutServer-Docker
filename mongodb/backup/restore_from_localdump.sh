#!/bin/bash
source ../../mongodb.env

user=$MONGODB_ADMINUSERNAME
password=$MONGODB_ADMINPASSWORD
host=localhost
port=27017
db=$MONGO_INITDB_DATABASE
dodropcollection="--drop"

datadumpdir=./data/dumps/$db

cmd="mongorestore ${dodropcollection} -v -u ${user} -p ${password} --host ${host} --port 27017 --authenticationDatabase admin --db ${db} --gzip ${datadumpdir}"
echo $cmd

# Run restore from container
docker exec -it mongodb1 $cmd
