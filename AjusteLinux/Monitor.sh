#!/bin/bash
# Monitor de RAM, ZRAM e Swapfile

while true; do
    clear
    echo "===== MEMÓRIA ====="
    free -h | awk 'NR==1 || NR==2 {print}'
    
    echo -e "\n===== SWAPFILE ====="
    swapon --show
    
    echo -e "\n===== ZRAM ====="
    zramctl
    
    echo -e "\n(Atualiza a cada 3s - pressione Ctrl+C para sair)"
    sleep 3
done
