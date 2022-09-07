# Pull base image.
FROM node:12-buster

# Build arguments
ARG BUILD_VERSION

# Labels
LABEL \
    Maintainer="tvelsberg" \
    Description="Nightscout" \
    Version=${BUILD_VERSION}

#
# CGM Remote Monitor Dockerfile
#
# https://github.com/dhermanns/rpi-nightscout
#


# install git and npm
RUN apt-get update && apt-get install -y software-properties-common python g++ make git

# Upgrade
RUN apt-get upgrade -y

# create node user
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN chown -R node:node /opt/app
USER node

# install the application
RUN git clone https://github.com/nightscout/cgm-remote-monitor.git . && \
    git checkout tags/14.0.3 && \
    npm install && \
    npm run postinstall && \
    npm run env && \
    npm audit fix

EXPOSE 1337

#CMD ["node", "lib/server/server.js"]

CMD ["node", "server.js"]

#CMD ["/bin/sh"]
