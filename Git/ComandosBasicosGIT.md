# Lista de comandos básicos mais utilizados ao trabalhar com versionamento em Git

## Vamos aos comandos

### Este é o primeiro comando a ser executado após instalar o Git. Ele possibilita configurar seu nome e endereço de email que ficará vinculado às alterações

    git config --global user.name "Nome do usuário"
    git config --global user.email "<seu@email.com>"

### Inicia ou cria um repositório

    git init

### Permite visualizar o estado do repositório

    git status

### Prepara o conteúdo para o próximo commit

    git add nome_do_arquivo
    git add .

### Salva o conteúdo atual junto com uma mensagem de registro do usuário que descreve as alterações

    git commit -m "Mensagem descritiva do commit".

### Clona um repositório existente

    git clone [url]

### Uma branch nada mais é do que uma ramificação dentro do repositório. Este comando pode ser utilizado de diversas maneiras

    git branch // Mostra as branches existentes em um repositório
    git branch <nome_da_branch> // Cria uma nova branch
    git branch -M <nome_da_branch> // Renomeia a branch atual

#### Permite mudar e criar uma nova branch com base em outra

    git checkout -b <nome da branch de origem> <nome da nova branch>

### Exibe um histórico de commits. Este comando pode ser utilizado de diversas formas

    git log
    git log --oneline

### Exibe o repositório remoto

    git remote
    git remote -v

### Baixa o conteúdo do repositório remoto, atualizando automaticamente o repositório local

    git pull

### Envia o conteúdo do repositório local, atualizando automaticamente o repositório remoto

    git push

### Especifique a URL da linha de comando ou configure um repositório remoto usando

    git remote add <name> <url> git (remote add origin https://github.com/fnddavi/...)

### e, em seguida, envie por push usando o nome remoto

    git push <name> (git push -u origin main)
