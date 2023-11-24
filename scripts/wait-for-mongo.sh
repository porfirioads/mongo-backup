#!/bin/bash

check_connection() {
    mongo \
        --username "$MONGO_RESTORE_USERNAME" \
        --password "$MONGO_RESTORE_PASSWORD" \
        --host "$MONGO_RESTORE_HOST" \
        --port "$MONGO_RESTORE_PORT" \
        --quiet \
        --eval "db.adminCommand('ping')" > /dev/null 2>&1
}

while true; do
    echo "Esperando a que MongoDB esté listo..."

    if check_connection; then
        echo "¡Conexión exitosa! El servidor de MongoDB está listo."
        break
    fi

    sleep 1
done
