param(
    [Parameter(Mandatory=$true)]
    [string]$Endpoint,
    
    [string]$Deployment = "gpt-5-mini",
    
    [string]$EmbeddingDeployment = "text-embedding-3-small"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$secretsId = "genai-beginners-dotnet"

# Check prerequisites
if (-not (Get-Command "dotnet" -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: 'dotnet' is not installed or not on PATH." -ForegroundColor Red
    exit 1
}

dotnet user-secrets set --id $secretsId "AzureOpenAI:Endpoint" $Endpoint
dotnet user-secrets set --id $secretsId "AzureOpenAI:Deployment" $Deployment
dotnet user-secrets set --id $secretsId "AzureOpenAI:EmbeddingDeployment" $EmbeddingDeployment