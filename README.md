# MONGO BACKUP

Project that makes a backup of a MongoDB user's databases.

## Usage

Create a .env file:

```bash
cp .env.example .env
```

Run the project:

```bash
docker-compose up
```

If you don't need to run a local instance of mongo, run only the needed containers:

```bash
docker-compose up mongodump mongorestore
```
