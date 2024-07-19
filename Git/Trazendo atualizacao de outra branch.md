# Git: Trazendo alterações da branch `branch_1` para a branch `branch_2`

## Como trazer alterações da branch `branch_1` para a branch `branch_2`.

### _Os nomes das branches utilizadas são genéricas e devem ser alterados de acordo com seu projeto._
---

1. Puxar as últimas alterações da `branch_1` antes de fazer o merge. Você pode fazer isso com:

>git pull origin branch_1

Isso garante que você está obtendo as alterações mais recentes.

2. Mudar para a branch `branch_2`: Primeiro, certifique-se de que você está na branch `branch_2` onde deseja trazer as alterações. Você pode fazer isso usando o comando:

> git checkout branch_2

3. Mesclar as alterações: Agora, você pode trazer as alterações da branch_1 para a `branch_2` com o comando merge. Isso irá mesclar as alterações da `branch_1` na `branch_2`:

> git merge branch_1

4. *Resolver conflitos*: Se houver conflitos entre as duas branches, você precisará resolvê-los manualmente. Depois de resolvidos, você pode adicionar os arquivos resolvidos ao commit de mesclagem com:

> git add nome_do_arquivo_resolvido

5. Concluir o processo de mesclagem: Uma vez que todos os conflitos tenham sido resolvidos e os arquivos correspondentes adicionados, você pode concluir o processo de mesclagem com:

> git commit -m "Merged branch_1 into branch_2"

6. Conclua com o push para a branch `branch_2`:

> git push origin branch_2

_Certifique-se de que deu certo a cada passo._