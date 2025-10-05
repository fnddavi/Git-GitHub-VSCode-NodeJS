#!/bin/bash

# Mensagem inicial
echo ">> Iniciando Script para 'git pull'"

# Lista de diretórios dos seus repositórios
diretorios=(
    "/home/fernando/Área de trabalho/Dev/4linuxmint"
    "/home/fernando/Área de trabalho/Dev/D-care"
    "/home/fernando/Área de trabalho/Dev/FernandoDavi"
    "/home/fernando/Área de trabalho/Dev/Git-GitHub-VSCode-NodeJS"
    "/home/fernando/Área de trabalho/Dev/LabDevMulti"
    "/home/fernando/Área de trabalho/Dev/MineracaoDados"
    "/home/fernando/Área de trabalho/Dev/QualidadeTesteSoftware"
)

# Armazena o diretório inicial
diretorio_inicial=$(pwd)

# Itera sobre cada diretório e executa o git pull
for diretorio in "${diretorios[@]}"; do
    if [ ! -d "$diretorio" ]; then
        echo "Diretório não encontrado: $diretorio"
        continue
    fi
    
    cd "$diretorio" || { echo "Erro ao acessar o diretório $diretorio"; continue; }
    nome_diretorio=$(basename "$diretorio")
    echo ">> Atualizando: $nome_diretorio"
    
    # Verifica se é um repositório Git
    if [ ! -d ".git" ]; then
        echo "Aviso: $nome_diretorio não é um repositório Git"
        cd "$diretorio_inicial" || { echo "Erro ao retornar ao diretório inicial"; exit 1; }
        continue
    fi
    
    output=$(git pull 2>&1)
    if [ $? -ne 0 ]; then
        echo "Erro ao executar git pull em $nome_diretorio:"
        echo "$output"
    else
        echo "'$nome_diretorio' $output"
    fi
    cd "$diretorio_inicial" || { echo "Erro ao retornar ao diretório inicial $diretorio_inicial"; exit 1; }
    sleep 1
done

echo ">> Script concluído"
echo "Pressione Enter para fechar..."
read -r

# 21-11-2024