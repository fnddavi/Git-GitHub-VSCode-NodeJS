#!/bin/bash
# restore_apps.sh — restaura pacotes, repositórios e chaves GPG salvos com backup_apps.sh

BACKUP_DIR="$HOME/backup_apps"
APT_FILE=$(find "$BACKUP_DIR" -name "apps_apt.txt" | head -n1)
SNAP_FILE=$(find "$BACKUP_DIR" -name "apps_snap.txt" | head -n1)
REPO_DIR=$(find "$BACKUP_DIR" -type d -name "repositorios" | head -n1)
KEYRINGS_DIR=$(find "$BACKUP_DIR" -type d -name "keyrings" | head -n1)

if [ ! -f "$APT_FILE" ] || [ ! -f "$SNAP_FILE" ]; then
    echo "❌ Arquivos de backup não encontrados em $BACKUP_DIR"
    echo "Certifique-se de ter rodado o backup_apps.sh antes."
    exit 1
fi

echo "🔄 Restaurando repositórios..."
sudo cp "$REPO_DIR"/*.list /etc/apt/sources.list.d/ -v 2>/dev/null || true
sudo cp "$REPO_DIR/sources.list" /etc/apt/sources.list -v 2>/dev/null || true

echo "🔄 Restaurando chaves GPG..."
sudo mkdir -p /usr/share/keyrings/
sudo cp "$KEYRINGS_DIR"/*.gpg /usr/share/keyrings/ -v 2>/dev/null || true

echo "🔄 Atualizando lista de pacotes..."
sudo apt update

echo "🔄 Reinstalando pacotes APT..."
sudo dpkg --set-selections < "$APT_FILE"
sudo apt-get dselect-upgrade -y

echo "🔄 Reinstalando pacotes SNAP..."
awk 'NR>1 {print $1}' "$SNAP_FILE" | while read -r snap_pkg; do
    sudo snap install "$snap_pkg" || echo "⚠️ Falha ao instalar $snap_pkg"
done

echo "✅ Restauração concluída!"
