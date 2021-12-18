#!/bin/bash
source ../../.env

# Dump Atlas MongoDb database for https://localhost/ database:
user=$MONGODB_ADMINUSERNAME
password=$MONGODB_ADMINPASSWORD
host=localhost
db=$MONGO_INITDB_DATABASE
datadumpdir=./data/dumps

cmd="mongodump -v -u $user -p $password --host $host --port 27017 --authenticationDatabase admin --db $db --out=${datadumpdir} --gzip"
echo $cmd

# Run dump from container
docker exec -it mongodb1 $cmd

# Optionally: Copy container data local
# echo "Copying data from container..."
# docker cp mongodb1:./data ./

echo "Done (datadump is on Docker volume - use get_data2local.sh to get the data locally)."

