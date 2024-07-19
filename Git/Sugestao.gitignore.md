# Sugestões de uso do .gitignore

## As entradas neste arquivo também podem seguir um padrão de correspondência:

    / é usado para ignorar nomes de caminhos relativos ao arquivo .gitignore
    doc/frotz

    # é usado para adicionar comentários ao arquivo .gitignore

### Aqui temos um exemplo de como pareceria um arquivo .gitignore:

    # Ignore os arquivos de sistema do Mac
    .DS_store

    # Ignore a pasta node_modules
    node_modules

    # Ignore todos os arquivos de texto
    * é usado para corresponder a um caractere curinga
    *.txt

    # Ignore arquivos relacionados às chaves de API
    .env

    # Ignore arquivos de configuração de SASS
    .sass-cache