#!/bin/bash
# backup_apps.sh — cria uma lista dos pacotes instalados e salva repositórios e chaves GPG
# Compatível com Linux Mint 22.1 / Ubuntu 24.04

BACKUP_DIR="$HOME/backup_apps_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR/repositorios"
mkdir -p "$BACKUP_DIR/keyrings"

echo "🔄 Gerando lista de pacotes APT..."
dpkg --get-selections > "$BACKUP_DIR/apps_apt.txt"

echo "🔄 Gerando lista de pacotes SNAP..."
snap list > "$BACKUP_DIR/apps_snap.txt"

echo "🔄 Salvando repositórios..."
cp /etc/apt/sources.list "$BACKUP_DIR/repositorios/" 2>/dev/null || true
cp /etc/apt/sources.list.d/*.list "$BACKUP_DIR/repositorios/" -v 2>/dev/null || true

echo "🔄 Salvando chaves GPG dos repositórios..."
cp /usr/share/keyrings/*.gpg "$BACKUP_DIR/keyrings/" -v 2>/dev/null || true

echo "✅ Backup concluído!"
echo "Arquivos salvos em: $BACKUP_DIR"
echo
echo "Conteúdo:"
ls -1 "$BACKUP_DIR"
