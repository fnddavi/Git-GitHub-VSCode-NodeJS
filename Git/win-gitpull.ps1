<#
 .SYNOPSIS
    Script PowerShell para executar 'git fetch' e 'git pull' em todos os repositórios Git dentro de um diretório base.
 .DESCRIPTION
    Este script localiza recursivamente todos os repositórios Git a partir de um diretório raiz
    e executa 'git fetch' e 'git pull' em cada um deles, exibindo o progresso e um relatório final.
 .PARAMETER BaseDir
    O caminho para o diretório raiz onde a busca por repositórios Git começará.
 .EXAMPLE
    .\win-gitpull.ps1 -BaseDir "D:\Fernando\Desenvolvimento"
#>
param (
    [string]$BaseDir = "C:\Users\ferna\Dev" # <== Altere aqui para o seu diretório principal de projetos
)

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ">> Iniciando Script para 'git fetch' e 'git pull'" -ForegroundColor Green

# Procura por repositórios Git recursivamente a partir do diretório base
Write-Host ">> Procurando por repositórios Git em '$BaseDir'..." -ForegroundColor Cyan
$diretorios = Get-ChildItem -Path $BaseDir -Recurse -Directory -Filter ".git" | ForEach-Object { $_.Parent.FullName }

$diretorioInicial = Get-Location

# Contador para estatísticas
$totalRepos = $diretorios.Count
$sucessos = 0
$erros = 0

if ($totalRepos -eq 0) {
    Write-Host ">> Nenhum repositório Git encontrado em '$BaseDir'." -ForegroundColor Yellow
    exit
}
Write-Host ">> Encontrados $totalRepos repositório(s) para atualizar." -ForegroundColor Cyan
Write-Host ""

# Itera sobre cada diretório e executa git fetch e git pull
for ($i = 0; $i -lt $diretorios.Count; $i++) {
    $diretorio = $diretorios[$i]
    $progresso = [math]::Round((($i + 1) / $totalRepos) * 100, 1)
    
    Write-Host "[$($i + 1)/$totalRepos - $progresso%] " -NoNewline -ForegroundColor Yellow
    
    if (Test-Path $diretorio) {
        try {
            Set-Location $diretorio
            $nomeDiretorio = Split-Path $diretorio -Leaf
            
            Write-Host "Atualizando: $nomeDiretorio" -ForegroundColor White
            
            # Verifica se é um repositório git
            if (Test-Path ".git") {
                # Executa git fetch
                Write-Host "  >> Executando git fetch..." -ForegroundColor Gray
                $fetchOutput = git fetch 2>&1
                
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "  ✓ Fetch realizado com sucesso" -ForegroundColor Green
                } else {
                    Write-Host "  ✗ Erro no git fetch: $fetchOutput" -ForegroundColor Red
                }
                
                # Executa git pull
                Write-Host "  >> Executando git pull..." -ForegroundColor Gray
                $pullOutput = git pull 2>&1
                
                if ($LASTEXITCODE -eq 0) {
                    if ($pullOutput -match "Already up to date" -or $pullOutput -match "Já atualizado") {
                        Write-Host "  ✓ Já está atualizado" -ForegroundColor Cyan
                    } else {
                        Write-Host "  ✓ Pull realizado: $pullOutput" -ForegroundColor Green
                    }
                    $sucessos++
                } else {
                    Write-Host "  ✗ Erro no git pull: $pullOutput" -ForegroundColor Red
                    $erros++
                }
            } else {
                Write-Host "  ⚠ Não é um repositório Git" -ForegroundColor Yellow
            }
            
            # Retorna ao diretório inicial
            Set-Location $diretorioInicial
            
        } catch {
            Write-Host "  ✗ Erro ao acessar o diretório: $($_.Exception.Message)" -ForegroundColor Red
            $erros++
            Set-Location $diretorioInicial
        }
    } else {
        Write-Host "Diretório não encontrado: $diretorio" -ForegroundColor Red
        $erros++
    }
    
    Write-Host ""
    Start-Sleep -Milliseconds 500
}

# Relatório final
Write-Host "=" * 50 -ForegroundColor Magenta
Write-Host ">> Script concluído!" -ForegroundColor Green
Write-Host ">> Estatísticas:" -ForegroundColor Cyan
Write-Host "   • Total de repositórios: $totalRepos" -ForegroundColor White
Write-Host "   • Sucessos: $sucessos" -ForegroundColor Green
Write-Host "   • Erros: $erros" -ForegroundColor Red
Write-Host "=" * 50 -ForegroundColor Magenta

# Pausa para ler o resultado
Write-Host "Pressione qualquer tecla para continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Atualizado em 23-11-2025