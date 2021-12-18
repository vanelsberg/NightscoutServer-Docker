#!/bin/bash
source ../../.env

# Dump Atlas MongoDb database for https://xxxxx.herokuapp.com/
user=$HEROKU_user
password=$HEROKU_password
host=$HEROKU_host
db=$HEROKU_db
datadumpdir=./data/dumps

cmd="mongodump --uri mongodb+srv://$user:$password@$host/$db --out $datadumpdir --gzip"
echo $cmd

# Run dump from container
docker exec -it mongodb1 $cmd

# Optionally: Copy container data local
# echo "Copying data from container..."
# docker cp mongodb1:./data ./

echo "Done (datadump is on Docker volume - use get_data2local.sh to get the data locally)."



