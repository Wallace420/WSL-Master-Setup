#!/bin/bash
function auto_backup_wsl() {
    BACKUP_DIR="$HOME/Backups"
    DISTRO_NAME="Ubuntu"
    BACKUP_FILE="$BACKUP_DIR/${DISTRO_NAME}_backup_$(date +%Y-%m-%d).tar"

    mkdir -p "$BACKUP_DIR"

    if [ "$(date +%u)" -eq 1 ]; then
        echo "🛡️ Automatisches Backup wird erstellt..."
        wsl --shutdown
        wsl --export "$DISTRO_NAME" "$BACKUP_FILE"
        echo "✅ Backup abgeschlossen: $BACKUP_FILE"
    fi
}

function cleanup_old_backups() {
    BACKUP_DIR="$HOME/Backups"
    mkdir -p "$BACKUP_DIR"
    find "$BACKUP_DIR" -type f -name "*.tar" -mtime +30 -exec rm {} \;
    echo "🧹 Alte Backups entfernt (älter als 30 Tage)."
}

auto_backup_wsl
cleanup_old_backups
