#!/bin/bash
echo "🔧 Starte System-Setup..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y htop btop ncdu aptitude unattended-upgrades ranger mc ufw nmap bleachbit micro bat fd-find snapd openssh-server lm-sensors

echo "alias fd=fdfind" >> ~/.bashrc
sudo ufw enable
sudo systemctl enable ssh
sudo systemctl start ssh
sudo sensors-detect --auto

cat << 'EOF' >> ~/.bashrc

function show_dashboard() {
  echo -e "\n\033[1;36m===============================\033[0m"
  echo -e "\033[1;36m 🚀  Systemübersicht\033[0m"
  echo -e "\033[1;36m===============================\033[0m"
  echo -e "\n⏳ \033[1;33mSystemlaufzeit:\033[0m"
  uptime -p
  echo -e "\n🖥️ \033[1;33mCPU-Auslastung:\033[0m"
  top -bn1 | grep "Cpu(s)" | awk '{print "CPU: " $2 "% user, " $4 "% idle"}'
  echo -e "\n🧠 \033[1;33mRAM Nutzung:\033[0m"
  free -h | awk '/^Mem/ {print "Used: " $3 " / Total: " $2}'
  echo -e "\n💾 \033[1;33mRoot-Speicherplatz:\033[0m"
  df -h / | awk 'NR==2{print $3 " benutzt von " $2}'
  echo -e "\n🌐 \033[1;33mLokale IP-Adresse:\033[0m"
  hostname -I | awk '{print $1}'
  if command -v sensors > /dev/null; then
    echo -e "\n🌡️ \033[1;33mTemperaturen:\033[0m"
    sensors | grep -E 'CPU|Core|Package'
  fi
  echo -e "\033[1;36m===============================\033[0m\n"
}

function security_check() {
  echo -e "\n\033[1;31m===============================\033[0m"
  echo -e "\033[1;31m 🛡️  Sicherheits-Status\033[0m"
  echo -e "\033[1;31m===============================\033[0m"
  echo -e "\n🛡️ \033[1;33mFirewall Status:\033[0m"
  sudo ufw status verbose
  echo -e "\n🔑 \033[1;33mSSH Server Status:\033[0m"
  if systemctl is-active ssh > /dev/null 2>&1; then
    echo -e "\033[1;32m✅ SSH läuft.\033[0m"
  else
    echo -e "\033[1;31m❌ SSH läuft NICHT!\033[0m"
  fi
  echo -e "\n🔎 \033[1;33mOffene Ports:\033[0m"
  sudo ss -tuln | grep LISTEN
  echo -e "\n\033[1;31m===============================\033[0m\n"
}

show_dashboard
security_check
EOF

source ~/.bashrc
echo "✅ Setup abgeschlossen!"
