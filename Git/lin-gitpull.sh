#!/bin/bash

# Mensagem inicial
echo ">> Iniciando Script para 'git pull'"

# Lista de diretórios dos seus repositórios
diretorios=(
    "/home/fernando/Área de Trabalho/Desenvolvimento/D-Nutri"
    "/home/fernando/Área de Trabalho/Desenvolvimento/IoT"
    "/home/fernando/Área de Trabalho/Desenvolvimento/LDW"
    "/home/fernando/Área de Trabalho/Desenvolvimento/PDM"
    "/home/fernando/Área de Trabalho/Desenvolvimento/PassosComPython"
    "/home/fernando/Área de Trabalho/Desenvolvimento/Git-GitHub-VSCode-NodeJS"
)

# Armazena o diretório inicial
diretorio_inicial=$(pwd)

# Itera sobre cada diretório e executa o git pull
for diretorio in "${diretorios[@]}"; do
    cd "$diretorio" || { echo "Erro ao acessar o diretório $diretorio"; continue; }
    nome_diretorio=$(basename "$diretorio")
    echo ">> Atualizando: $nome_diretorio"
    output=$(git pull)
    if [ $? -ne 0 ]; then
        echo "Erro ao executar git pull em $diretorio"
    else
        echo "'$nome_diretorio' $output"
    fi
    cd "$diretorio_inicial" || { echo "Erro ao retornar ao diretório inicial $diretorio_inicial"; exit 1; }
    sleep 2
done

echo ">> Script concluído"
sleep 2

# 21-11-2024