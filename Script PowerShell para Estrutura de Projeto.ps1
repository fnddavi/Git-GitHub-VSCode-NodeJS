# Define o nome da pasta principal do projeto
$projectName = "fake_news_api"

# Cria a pasta principal do projeto
New-Item -ItemType Directory -Path $projectName -Force

# Define o caminho para a pasta 'app'
$appPath = Join-Path -Path $projectName -ChildPath "app"
New-Item -ItemType Directory -Path $appPath -Force

# Cria os arquivos dentro da pasta 'app'
New-Item -ItemType File -Path (Join-Path -Path $appPath -ChildPath "main.py") -Force
New-Item -ItemType File -Path (Join-Path -Path $appPath -ChildPath "model.py") -Force
New-Item -ItemType File -Path (Join-Path -Path $appPath -ChildPath "classifier.py") -Force
New-Item -ItemType File -Path (Join-Path -Path $appPath -ChildPath "database.py") -Force
New-Item -ItemType File -Path (Join-Path -Path $appPath -ChildPath "utils.py") -Force

# Define o caminho para a pasta 'data'
$dataPath = Join-Path -Path $projectName -ChildPath "data"
New-Item -ItemType Directory -Path $dataPath -Force

# Cria o arquivo dentro da pasta 'data'
New-Item -ItemType File -Path (Join-Path -Path $dataPath -ChildPath "dataset.csv") -Force

# Define o caminho para a pasta 'models'
$modelsPath = Join-Path -Path $projectName -ChildPath "models"
New-Item -ItemType Directory -Path $modelsPath -Force

# Cria o arquivo dentro da pasta 'models'
New-Item -ItemType File -Path (Join-Path -Path $modelsPath -ChildPath "modelo.pkl") -Force

# Cria os arquivos na raiz do projeto
New-Item -ItemType File -Path (Join-Path -Path $projectName -ChildPath "requirements.txt") -Force
New-Item -ItemType File -Path (Join-Path -Path $projectName -ChildPath "README.md") -Force

Write-Host "Estrutura de diretórios e arquivos para '$projectName' criada com sucesso!"
