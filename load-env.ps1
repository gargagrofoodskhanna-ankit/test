# Load Environment Variables
# Run this script to set up your development environment

Write-Host "Loading environment variables..." -ForegroundColor Green

# Load .env file if it exists
if (Test-Path ".env") {
    Get-Content ".env" | ForEach-Object {
        if ($_ -match "^([^#][^=]+)=(.*)$") {
            [Environment]::SetEnvironmentVariable($matches[1], $matches[2], "Process")
            Write-Host "Set $($matches[1]) = $($matches[2])" -ForegroundColor Yellow
        }
    }
}

# Add Git to PATH
$gitPath = "C:\Program Files\Git\bin"
if (Test-Path $gitPath) {
    $env:PATH += ";$gitPath"
    Write-Host "Added Git to PATH" -ForegroundColor Green
}

Write-Host "Environment setup complete!" -ForegroundColor Green