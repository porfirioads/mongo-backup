/scripts/wait-for-it.sh $MONGO_RESTORE_HOST:$MONGO_RESTORE_PORT -t 0

/scripts/wait-for-backup.sh

mongorestore --uri="$MONGO_RESTORE_URI" /backup
