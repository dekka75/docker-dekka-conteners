#!/bin/bash

cd /opt/node

# Delete content
if [ "$DEKKA_FORCE" = "true" ]; then
    rm -rf *
fi
# Install application
if [ ! -f /opt/node/bin/www ]; then
    if [ "$DEKKA_APP_NAME" = "express" ]; then
        tar -xvf /home/express-dekka-app.tar
    elif [ "$DEKKA_APP_NAME" = "imock-server" ]; then  
        tar -xvf /home/imock-dekka-server.tar
    fi
    npm install
fi

npm start