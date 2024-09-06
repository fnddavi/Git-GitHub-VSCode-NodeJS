# Lista de diretórios dos seus repositórios
$diretorios = @(
    "D:\Fernando\Desenvolvimento\2oSem2024\D-Nutri"
    "D:\Fernando\Desenvolvimento\2oSem2024\IoT"
    "D:\Fernando\Desenvolvimento\2oSem2024\LDW"
    "D:\Fernando\Desenvolvimento\2oSem2024\PDM"
)

# Itera sobre cada diretório e executa o git pull
foreach ($diretorio in $diretorios) {
    try {
        Set-Location -Path $diretorio
        git pull
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Erro ao executar git pull em $diretorio"
        }
    } catch {
        Write-Host "Erro ao acessar o diretório $diretorio"
    } finally {
        Set-Location -Path -
    }
    Start-Sleep -Seconds 6
}
