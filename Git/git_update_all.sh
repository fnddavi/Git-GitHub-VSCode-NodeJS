#!/bin/zsh

# Caminho base do workspace
WORKSPACE="/home/fernando/Área de trabalho/Dev"

# Percorre todas as subpastas
for dir in $WORKSPACE/*(/); do
  if [ -d "$dir/.git" ]; then
    echo "Atualizando repositório em: $dir"
    cd "$dir"
    git fetch --all
    git pull
    cd "$WORKSPACE"
  fi
done

echo "Script concluído!"
echo "Pressione Enter para fechar..."
read -r