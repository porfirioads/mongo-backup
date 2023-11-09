if [ -f /backup/dump ]; then
    rm /backup/dump
fi

mongodump --uri="$MONGO_BACKUP_URI" --out /backup

touch /backup/dump
