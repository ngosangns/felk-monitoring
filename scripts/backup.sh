#!/bin/bash
# Backup MySQL and Elasticsearch data
set -e
BACKUP_DIR=${1:-/backup}
DATE=$(date +%F-%H%M)

mkdir -p "$BACKUP_DIR"

# MySQL backup
if docker exec mysql-db sh -c 'command -v mysqldump' > /dev/null; then
  echo "Backing up MySQL..."
  docker exec mysql-db mysqldump -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASSWORD $WORDPRESS_DB_NAME > "$BACKUP_DIR/mysql-$DATE.sql"
fi

# Elasticsearch backup (snapshot API)
if docker exec elasticsearch curl --silent --fail localhost:9200 > /dev/null; then
  echo "Backing up Elasticsearch..."
  docker exec elasticsearch curl -XPUT "localhost:9200/_snapshot/backup_repo" -H 'Content-Type: application/json' -d '{"type": "fs", "settings": {"location": "/usr/share/elasticsearch/backup"}}'
  docker exec elasticsearch curl -XPUT "localhost:9200/_snapshot/backup_repo/snapshot_$DATE?wait_for_completion=true"
fi

echo "Backup completed at $BACKUP_DIR."
