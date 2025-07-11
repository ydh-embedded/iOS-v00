#!/bin/bash

# Auto Backup Script (for cron)
# Usage: Add to crontab: 0 2 * * * /path/to/auto-backup.sh

cd "$(dirname "$0")/.."
./scripts/backup.sh >> backup.log 2>&1

# Optional: Upload to cloud
if [ "$CLOUD_BACKUP" = "true" ]; then
    echo "☁️ Uploading to cloud..."
    # Add your cloud upload logic here
    # Examples:
    # rclone copy backup.tar.gz googledrive:backups/
    # aws s3 cp backup.tar.gz s3://your-bucket/backups/
fi
