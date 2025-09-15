# Manual Git Commit and Push Script
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Manual Git Commit and Push Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Disable git pager to avoid terminal issues
$env:GIT_PAGER = ""

Write-Host "Step 1: Checking current git status..." -ForegroundColor Yellow
$status = git status --porcelain
if ($status) {
    Write-Host "Changes found:" -ForegroundColor Green
    $status | ForEach-Object { Write-Host "  $_" -ForegroundColor White }
} else {
    Write-Host "No changes to commit" -ForegroundColor Yellow
}
Write-Host ""

Write-Host "Step 2: Adding all changes to staging area..." -ForegroundColor Yellow
git add .
Write-Host ""

Write-Host "Step 3: Checking what will be committed..." -ForegroundColor Yellow
$staged = git diff --cached --name-only
if ($staged) {
    Write-Host "Files staged for commit:" -ForegroundColor Green
    $staged | ForEach-Object { Write-Host "  $_" -ForegroundColor White }
} else {
    Write-Host "No files staged" -ForegroundColor Yellow
}
Write-Host ""

Write-Host "Step 4: Committing changes..." -ForegroundColor Yellow
git commit -m "Update grain procurement system with latest changes"
if ($LASTEXITCODE -eq 0) {
    Write-Host "Commit successful!" -ForegroundColor Green
} else {
    Write-Host "Commit failed or no changes to commit" -ForegroundColor Red
}
Write-Host ""

Write-Host "Step 5: Pushing to repository..." -ForegroundColor Yellow
git push origin main
if ($LASTEXITCODE -eq 0) {
    Write-Host "Push successful!" -ForegroundColor Green
} else {
    Write-Host "Push failed" -ForegroundColor Red
}
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Process completed!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
