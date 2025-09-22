# Script PowerShell simplificado para git fetch e pull
# Execução rápida em todos os repositórios

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

$diretorioInicial = Get-Location

foreach ($dir in $diretorios) {
    if (Test-Path $dir) {
        Set-Location $dir
        if (Test-Path ".git") {
            $nome = Split-Path $dir -Leaf
            Write-Host "Atualizando $nome..." -ForegroundColor Cyan
            git fetch
            git pull
        }
        Set-Location $diretorioInicial
    }
}