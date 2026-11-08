# SQL database first; local EF tool pinned to the same version as the packages.
$ErrorActionPreference = "Stop"
Push-Location (Split-Path $PSScriptRoot -Parent)
try {
    dotnet tool restore
    if ($LASTEXITCODE -ne 0) { throw "EF tool restore failed. Install .NET 8 SDK and check NuGet access." }
    dotnet ef dbcontext scaffold "Name=ConnectionStrings:BookStore" Microsoft.EntityFrameworkCore.SqlServer --context BookStoreContext --context-dir Data --output-dir Models --namespace BookStoreOnline.Models --context-namespace BookStoreOnline.Data --no-onconfiguring --force
    if ($LASTEXITCODE -ne 0) { throw "Scaffolding failed. Check the SQL connection and that schema was created." }
    dotnet build
    if ($LASTEXITCODE -ne 0) { throw "Build failed after scaffolding." }
    Write-Host "Database First scaffold and build completed."
} finally { Pop-Location }
