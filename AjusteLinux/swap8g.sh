#!/bin/bash
# Script para recriar swapfile de 8GB

# Desativa swap atual
sudo swapoff -a

# Remove swap antigo
sudo rm -f /swapfile

# Cria novo swapfile de 8GB
sudo fallocate -l 8G /swapfile

# Define permissões corretas
sudo chmod 600 /swapfile

# Formata como swap
sudo mkswap /swapfile

# Ativa novo swap
sudo swapon /swapfile

# Garante que será usado no boot
if ! grep -q '/swapfile' /etc/fstab; then
  echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi

# Mostra resultado
swapon --show
free -h

