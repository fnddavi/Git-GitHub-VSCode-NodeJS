#!/bin/bash

# Lê o nome da pasta principal
read -p "Digite o nome da pasta principal (sugestão: src): " main_folder

# Verifica se o nome da pasta é válido
if [[ ! $main_folder =~ ^[[:alnum:]]+$ ]]; then
  echo "Nome de pasta inválido. Use apenas letras e números."
  exit 1
fi

# Subpastas a serem criadas (perguntadas ao usuário)
subfolders=("contexts" "hooks" "screens" "services" "types" "components" "routes" "themes")

# Função para criar uma pasta e verificar se foi criada com sucesso
create_folder() {
  mkdir -p "$1" || { echo "Erro ao criar a pasta $1"; exit 1; }
  echo "Pasta $1 criada com sucesso."
}

# Função para criar um arquivo de exemplo
create_file() {
  touch "$1" || { echo "Erro ao criar o arquivo $1"; exit 1; }
  echo "Arquivo $1 criado com sucesso."
}

# Cria a pasta principal
create_folder "$main_folder"

# Itera pelas subpastas e pergunta ao usuário se deseja criá-las
for folder in "${subfolders[@]}"; do
  read -p "Deseja criar a pasta $folder? (s/n): " create_folder_answer
  if [[ $create_folder_answer == "s" ]]; then
    folder_path="$main_folder/$folder"
    create_folder "$folder_path"
    create_file "$folder_path/index.ts"
  else
    echo "Pasta $folder não foi criada."
  fi
done

echo "Estrutura criada com sucesso!"
