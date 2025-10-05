#!/bin/bash
# Script para aumentar o tamanho do swapfile

# Defina o tamanho desejado do swap (em GB)
NOVO_SWAP_GB=8

# Desativa o swap atual
sudo swapoff -a

# Remove o swapfile antigo (se existir)
sudo rm -f /swapfile

# Cria um novo swapfile com o tamanho especificado
sudo fallocate -l ${NOVO_SWAP_GB}G /swapfile

# Ajusta as permissões corretas
sudo chmod 600 /swapfile

# Configura como swap
sudo mkswap /swapfile

# Ativa o novo swap
sudo swapon /swapfile

# Garante que seja montado automaticamente no boot
if grep -q "/swapfile" /etc/fstab; then
    sudo sed -i "s|^/swapfile.*|/swapfile none swap sw 0 0|" /etc/fstab
else
    echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
fi

# Mostra o resultado
echo "Swapfile recriado com ${NOVO_SWAP_GB} GB"
free -h
