#!/bin/bash

user=root
password=pass12345
port=27017
dodropcollection="--drop"
db=nightscoutdb
datadir=./data

host=localhost

cmd="mongorestore ${dodropcollection} -v -u ${user} -p ${password} --host ${host} --port 27017 --authenticationDatabase admin --db ${db} --gzip ${datadir}"

echo $cmd
#$cmd

# Run restore from container
docker exec -it mongodb1 $cmd
