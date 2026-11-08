$ErrorActionPreference = "Stop"
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    dotnet --version
    if ($LASTEXITCODE -ne 0) { throw "Install .NET 8 SDK (x64), then reopen Visual Studio." }
    dotnet restore
    if ($LASTEXITCODE -ne 0) { throw "Restore failed." }
    dotnet build --no-restore
    if ($LASTEXITCODE -ne 0) { throw "Build failed." }
    Write-Host "Build passed. Continue with docs/KIEM_THU.md against SQL Server."
} finally { Pop-Location }
