#!/bin/bash

# Backup thoug executing mogodump on the mongodb server
# (Output will be on /data/db): move out to external storage location...(e.g: sudo mv ../data/bu_temp/* .)
# docker exec -it mongodb mongodump -v -u root -p pass12345 --host localhost --port 27017 --authenticationDatabase admin --db nightscoutdb --out=/data/db/bu_temp --gzip

# Dump using locally installed mogodump
# mongodump -v -u root -p pass12345 --host localhost --port 27017 --authenticationDatabase admin --db nightscoutdb --out=./data --gzip


# Dump Atlas MongoDb databse for https://localhost/ database:
user=root
password=pass12345
host=localhost
db=nightscoutdb

cmd="mongodump -v -u root -p root12345 --host localhost --port 27017 --authenticationDatabase admin --db nightscoutdb --out=./data --gzip"
echo $cmd
#$cmd

# Run dump from container
docker exec -it mongodb1 $cmd

# Optionally: Copy container data local
#echo "Copying data from comtainer..."
#docker cp mongodb1:./data ./

echo "Done."


