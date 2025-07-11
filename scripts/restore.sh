#!/bin/bash

# Project Restore Script

BACKUP_DIR="$HOME/project-backups"
PROJECT_NAME=$(basename "$(pwd)")

echo "🔄 PROJECT RESTORE"
echo "=================="

# List available backups
echo "📋 Available backups:"
cd "$BACKUP_DIR"
ls -lh ${PROJECT_NAME}_*.tar.gz 2>/dev/null || {
    echo "❌ No backups found for $PROJECT_NAME"
    exit 1
}

echo ""
read -p "📝 Enter backup filename (without .tar.gz): " BACKUP_NAME

if [ ! -f "$BACKUP_DIR/${BACKUP_NAME}.tar.gz" ]; then
    echo "❌ Backup not found: ${BACKUP_NAME}.tar.gz"
    exit 1
fi

echo ""
read -p "⚠️ This will overwrite current project. Continue? (y/N): " CONFIRM

if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "❌ Restore cancelled"
    exit 0
fi

# Go back to project directory
cd - > /dev/null

# Extract backup
echo "📦 Restoring from backup..."
tar -xzf "$BACKUP_DIR/${BACKUP_NAME}.tar.gz"

if [ $? -eq 0 ]; then
    echo "✅ Restore completed successfully!"
    echo "📂 Project restored from: ${BACKUP_NAME}.tar.gz"
else
    echo "❌ Restore failed!"
    exit 1
fi
