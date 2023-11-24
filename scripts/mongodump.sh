#!/bin/bash

if [ -f /backup/dump ]; then
    rm /backup/dump
fi

# Obtiene lista de bases de datos de mongodb
databases=$(
    mongo \
        --username $MONGO_BACKUP_USERNAME \
        --password $MONGO_BACKUP_PASSWORD \
        --host "$MONGO_BACKUP_HOST" \
        --port "$MONGO_BACKUP_PORT" \
        --tls \
        --tlsAllowInvalidCertificates \
        --quiet \
        --eval "db.getMongo().getDBNames()" | grep -vE '^{.*}$' | jq -r '.[]'
)

# Recorre las bases de datos y realiza los respaldos
for db in $databases; do
    mongodump \
        --username "$MONGO_BACKUP_USERNAME" \
        --password "$MONGO_BACKUP_PASSWORD" \
        --host "$MONGO_BACKUP_HOST" \
        --port "$MONGO_BACKUP_PORT" \
        --db "$db" \
        --ssl \
        --tlsInsecure \
        --readPreference "secondary" \
        --out /backup
done

touch /backup/dump
