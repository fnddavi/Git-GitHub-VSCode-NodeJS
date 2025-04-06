# Como Adicionar uma Ação Personalizada no Nemo (Linux Mint)

O Nemo, gerenciador de arquivos do Linux Mint, permite adicionar ações personalizadas para facilitar tarefas específicas. Siga os passos abaixo para criar uma ação personalizada:

## Passo 1: Acesse o Diretório de Ações do Nemo
Abra o terminal e navegue até o diretório onde as ações personalizadas são armazenadas:
```bash
cd ~/.local/share/nemo/actions
```

Se o diretório não existir, crie-o:
```bash
mkdir -p ~/.local/share/nemo/actions
```

## Passo 2: Crie o Arquivo de Configuração
Crie um arquivo `.nemo_action` para definir sua ação personalizada. Por exemplo:
```bash
nano abrir_no_vscode.nemo_action
```

## Passo 3: Configure a Ação
Adicione o seguinte conteúdo ao arquivo, ajustando conforme necessário:
```ini
[Nemo Action]
Name=Abrir no VSCode
Comment=Open the selected folder in VS Code
Exec=code %F
Icon-Name=com.visualstudio.code
Selection=Any
Extensions=dir;
Active=true

```

- **Name**: Nome da ação que aparecerá no menu.
- **Comment**: Descrição da ação.
- **Exec**: Comando a ser executado (`%F` representa o arquivo ou pasta selecionado).
- **Icon-Name**: Ícone exibido no menu.
- **Selection**: Define se a ação aparece para arquivos, pastas ou ambos.
- **Extensions**: Tipos de arquivos suportados (`any` para todos os tipos).

## Passo 4: Salve e Teste
Salve o arquivo e reinicie o Nemo para aplicar as alterações:
```bash
nemo -q
```

Agora, clique com o botão direito em um arquivo ou pasta e verifique se a ação "Abrir no VSCode" aparece no menu.

## Passo 5: Personalize Mais
Você pode criar outras ações personalizadas seguindo o mesmo formato, ajustando os comandos e configurações conforme necessário.

## Referências
Consulte a [documentação oficial do Nemo](https://github.com/linuxmint/nemo) para mais detalhes.
