## Nightscout Docker deployemnt

### Dependancies

    * Docker
        - Docker Desktop for Windows 10/WSL2
        
    * Images form the Docker repository (try "docker search mongo")
        - mongo
        - mongo-express

Notes:

### Nightscout setting:

Hosting setting are in dockercompose.yml, site settings you can find in nightscout.env environment file

    * INSECURE_USE_HTTP=true
        Make sure to set the environem variable "INSECURE_USE_HTTP=true" when running testing.
        Also use when hsting behind NGinx.
        See https://github.com/nightscout/cgm-remote-monitor#predefined-values-for-your-server-settings-optional

    * ...

The API Secret is at ns-apisecret.env (keep secure, not in git for production!)

## MongoDB

### Mongo setup

        see:
        https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

### Uninstall MongoDb:

        sudo apt-get purge mongodb-org*
        sudo rm -r /var/log/mongodb
        sudo rm -r /var/lib/mongodb


#### Data

Data is stored at a external Docker volume were the actual data is local on the host running docker
Create the volumen with create_data_volume.sh:

        docker volume create --driver local \
            --opt type=none \
            --opt device=/home/theo/NS/mongodb/data \
            --opt o=bind mongodbdata

Due to a A bug in Docker Desktop version 4.1 for Windows 10/WSL2, after restarting Docker the volume can not be found
This can be fixed by re-running the "docker volume create" that wa sused to create the volume. No data will be lost.

When running nightscout on Heroku, use thsi to make dump from the database:

        mongodump --uri mongodb+srv://$user:$password@$host/$db --out ./backup --gzip

To dump the nightscout Mongo database in this repository:

        mongodump -v -u root -p pass12345 --host localhost --port 27017 --authenticationDatabase admin --db nightscoutdb --out=./backup --gzip


# Hosting behinf Nginx

See:

- Nginx: https://github.com/nightscout/cgm-remote-monitor#installation-notes-for-users-with-nginx-or-apache-reverse-proxy-for-ssltls-offloading
- SSL: https://letsencrypt.org/
- Certbot: https://certbot.eff.org
- DOMAIN: https://nl.godaddy.com/


### Deploy on RPI 4 issues

On the RPI4 test system runing Ubuntu 20.10, only the "vfs" filesystem was supported:

        $ cat /etc/docker/daemon.json 
        {
        "storage-driver": "vfs"
        }

Because of The (most likely?) external volumes do not work.

    _Change on the docker-compose.yml file_

        volumes:
        mongodbdata:
        #  external: true

The RPI4 CPU is only supported for MongoDB version 4 or lower

    _Change on the docker-compose.yml file_

        services:
        mongodb:
            image: mongo:4.4
