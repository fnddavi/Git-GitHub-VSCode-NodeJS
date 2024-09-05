#!/bin/bash

# Lista de diretórios dos seus repositórios
diretorios=(
    "/home/fernando/Área de Trabalho/Desinvolvimento/D-Nutri"
    "/home/fernando/Área de Trabalho/Desinvolvimento/IoT"
    "/home/fernando/Área de Trabalho/Desinvolvimento/LDW"
    "/home/fernando/Área de Trabalho/Desinvolvimento/PDM"
    "/home/fernando/Área de Trabalho/Desinvolvimento/PassosComPython"
    "/home/fernando/Área de Trabalho/Desinvolvimento/Git-GitHub-VSCode-NodeJS"
)

# Itera sobre cada diretório e executa o git pull
for diretorio in "${diretorios[@]}"; do
    cd "$diretorio"
    git pull || echo "Erro ao executar git pull em $diretorio"
    cd -
    sleep 6
done
