#!/bin/bash
DISTRO_NAME="Ubuntu"
BACKUP_DIR="$HOME/Backups"
BACKUP_FILE="$BACKUP_DIR/${DISTRO_NAME}_backup.tar"

mkdir -p "$BACKUP_DIR"

echo "🔍 Bitte wählen:"
echo "1) Backup erstellen"
echo "2) Backup wiederherstellen"
read -p "Auswahl (1/2): " choice

if [ "$choice" == "1" ]; then
    echo "🛑 Stoppe laufende WSL-Instanz..."
    wsl --shutdown
    echo "💾 Erstelle Backup..."
    wsl --export "$DISTRO_NAME" "$BACKUP_FILE"
    echo "✅ Backup abgeschlossen!"
elif [ "$choice" == "2" ]; then
    read -p "‼️ ACHTUNG: Vor Restore wird die alte Distro gelöscht. Fortfahren? (yes/no): " confirm
    if [ "$confirm" == "yes" ]; then
        wsl --shutdown
        wsl --unregister "$DISTRO_NAME"
        wsl --import "$DISTRO_NAME" "$HOME/$DISTRO_NAME" "$BACKUP_FILE" --version 2
        echo "✅ Wiederherstellung abgeschlossen!"
    else
        echo "❌ Abbruch durch Benutzer."
    fi
else
    echo "❌ Ungültige Eingabe."
fi
