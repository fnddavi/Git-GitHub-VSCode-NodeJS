# Script PowerShell para git fetch e git pull em todos os projetos
# Para acentos não truncarem
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Mensagem inicial
Write-Host ">> Iniciando Script para 'git fetch' e 'git pull'" -ForegroundColor Green

# Lista de diretórios dos seus repositórios
$diretorios = @(
    "D:\Fernando\Desenvolvimento\D-care",
    "D:\Fernando\Desenvolvimento\D-FireTrack", 
    "D:\Fernando\Desenvolvimento\FernandoDavi",
    "D:\Fernando\Desenvolvimento\FormularioComPython",
    "D:\Fernando\Desenvolvimento\Git-GitHub-VSCode-NodeJS",
    "D:\Fernando\Desenvolvimento\LabDevMulti",
    "D:\Fernando\Desenvolvimento\Machine-Learning",
    "D:\Fernando\Desenvolvimento\PDM-II",
    "D:\Fernando\Desenvolvimento\QualidadeTesteSoftware",
    "D:\Fernando\Desenvolvimento\ra2581392313029",
    "D:\Fernando\Desenvolvimento\SDA"
)

# Armazena o diretório inicial
$diretorioInicial = Get-Location

# Contador para estatísticas
$totalRepos = $diretorios.Count
$sucessos = 0
$erros = 0

Write-Host ">> Encontrados $totalRepos repositórios para atualizar" -ForegroundColor Cyan
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

# Atualizado em 19-09-2025