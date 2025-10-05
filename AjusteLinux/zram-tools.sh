#!/bin/bash
# Script para instalar e configurar ZRAM com zram-tools

# Instalar o pacote (se ainda não tiver)
sudo apt update
sudo apt install -y zram-tools

# Configuração padrão: metade da RAM para ZRAM
# Você pode editar /etc/default/zramswap depois se quiser mudar
CONF_FILE="/etc/default/zramswap"

# Ajusta configuração para usar metade da RAM (pode trocar ZRAM_SIZE se quiser outro valor)
if [ -f "$CONF_FILE" ]; then
    sudo sed -i 's/^#*ALGO=.*/ALGO=lz4/' $CONF_FILE
    sudo sed -i 's/^#*PERCENT=.*/PERCENT=50/' $CONF_FILE
else
    echo "ALGO=lz4" | sudo tee $CONF_FILE
    echo "PERCENT=50" | sudo tee -a $CONF_FILE
fi

# Reinicia o serviço zramswap
sudo systemctl restart zramswap

# Habilita na inicialização
sudo systemctl enable zramswap

echo "ZRAM ativado com sucesso!"
echo "Verifique com: zramctl ou swapon --show"
