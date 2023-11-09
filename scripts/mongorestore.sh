/scripts/wait-for-backup.sh

mongorestore --uri="$MONGO_RESTORE_URI" /backup
