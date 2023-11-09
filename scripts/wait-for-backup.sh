#!/bin/bash

echo "Esperando a que el respaldo esté listo..."

while [ ! -f /backup/dump ]; do
    sleep 1
    echo "Esperando a que el respaldo esté listo..."
done

echo "¡Respaldo listo! Iniciando mongorestore..."
