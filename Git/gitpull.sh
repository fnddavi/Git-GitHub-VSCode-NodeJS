#!/bin/bash

# Lista de diretórios dos seus repositórios
diretorios=(
    "/home/fernando/Área de Trabalho/Desenvolvimento/D-Nutri"
    "/home/fernando/Área de Trabalho/Desenvolvimento/IoT"
    "/home/fernando/Área de Trabalho/Desenvolvimento/LDW"
    "/home/fernando/Área de Trabalho/Desenvolvimento/PDM"
    "/home/fernando/Área de Trabalho/Desenvolvimento/PassosComPython"
    "/home/fernando/Área de Trabalho/Desenvolvimento/Git-GitHub-VSCode-NodeJS"
)

# Itera sobre cada diretório e executa o git pull
for diretorio in "${diretorios[@]}"; do
    cd "$diretorio"
    git pull || echo "Erro ao executar git pull em $diretorio"
    cd -
    sleep 6
done
