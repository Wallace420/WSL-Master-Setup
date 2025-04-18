# 🚀 WSL-Master-Setup

[![Maintained](https://img.shields.io/badge/maintained-yes-brightgreen.svg)](https://github.com/Wallace420/WSL-Master-Setup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Built for WSL2](https://img.shields.io/badge/Built%20for-WSL2-blue.svg)](https://learn.microsoft.com/en-us/windows/wsl/)

---

## 📦 Projektbeschreibung

Ein vollständiges Automatisierungs-Setup für WSL/Linux-Nutzer:
- Installation aller wichtigen Linux-Tools
- Sicherer SSH-Server
- Dashboard und Security-Check im Terminal
- Automatisches wöchentliches Backup
- Automatische Bereinigung alter Backups
- Komplett wartungsfreier Betrieb

---

## 🚀 Schnelleinstieg

```bash
git clone https://github.com/Wallace420/WSL-Master-Setup.git
cd WSL-Master-Setup
chmod +x setup-linux.sh
./setup-linux.sh
💾 Manuelles Backup erstellen
bash
Code kopieren
chmod +x backup-wsl.sh
./backup-wsl.sh
🔁 Automatisches Backup + Auto-Cleanup
auto-backup.sh wird automatisch in deine .bashrc integriert, um jeden Montag ein neues Backup zu erstellen.

Alte Backups älter als 30 Tage werden automatisch gelöscht.

📜 Lizenz
Dieses Projekt steht unter der MIT Lizenz.

🧠 Credits
Projekt erstellt von Wallace420 🎯