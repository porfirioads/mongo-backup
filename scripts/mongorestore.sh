#!/bin/bash

/scripts/wait-for-mongo.sh

/scripts/wait-for-backup.sh

for db in $(ls /backup); do
    if [ -d "/backup/$db" ]; then
        mongo \
            --username "$MONGO_RESTORE_USERNAME" \
            --password "$MONGO_RESTORE_PASSWORD" \
            --host "$MONGO_RESTORE_HOST" \
            --port "$MONGO_RESTORE_PORT" \
            --eval "db.getSiblingDB('$db');"

        mongorestore \
            --username "$MONGO_RESTORE_USERNAME" \
            --password "$MONGO_RESTORE_PASSWORD" \
            --host "$MONGO_RESTORE_HOST" \
            --port "$MONGO_RESTORE_PORT" \
            --drop \
            /backup
    fi
done
