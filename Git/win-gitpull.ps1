#Para acentos não truncarem
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Mensagem inicial
Write-Host ">> Iniciando Script para 'git pull' \n"

# Lista de diretórios dos seus repositórios
$diretorios = @(
    "C:\Users\Fernando\Desenvolvimento\D-Nutri"
    "C:\Users\Fernando\Desenvolvimento\IoT"
    "C:\Users\Fernando\Desenvolvimento\LDW"
    "C:\Users\Fernando\Desenvolvimento\PDM"
    "C:\Users\Fernando\Desenvolvimento\Git-GitHub-VSCode-NodeJS"
)

# Armazena o diretório inicial
$diretorioInicial = Get-Location

# Itera sobre cada diretório e executa o git pull
foreach ($diretorio in $diretorios) {
    try {
        Set-Location -Path $diretorio
        $nomeDiretorio = Split-Path -Path $diretorio -Leaf
        Write-Host "... Atualizando: $nomeDiretorio"
        $output = git pull
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Erro ao executar 'git pull' em $diretorio"
        } else {
            Write-Host "'$nomeDiretorio' $($output -join ' ')"
        }
    } catch {
        Write-Host "Erro ao acessar o diretório $diretorio"
    } finally {
        Set-Location -Path $diretorioInicial
    }
    Start-Sleep -Seconds 1
}

Write-Host ">> Script concluído"
Start-Sleep -Seconds 2

#21-11-2024