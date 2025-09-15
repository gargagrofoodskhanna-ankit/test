# PowerShell script to commit and push changes
Write-Host "Starting git operations..." -ForegroundColor Green

# Set git to not use pager
$env:GIT_PAGER = "cat"

Write-Host "Adding all files..." -ForegroundColor Yellow
git add . 2>$null

Write-Host "Checking status..." -ForegroundColor Yellow
$status = git status --porcelain 2>$null
if ($status) {
    Write-Host "Changes found, committing..." -ForegroundColor Yellow
    git commit -m "Update grain procurement system with latest changes" 2>$null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Commit successful, pushing to repository..." -ForegroundColor Yellow
        git push origin main 2>$null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Successfully committed and pushed changes!" -ForegroundColor Green
        } else {
            Write-Host "Push failed" -ForegroundColor Red
        }
    } else {
        Write-Host "Commit failed" -ForegroundColor Red
    }
} else {
    Write-Host "No changes to commit" -ForegroundColor Yellow
}

Write-Host "Done!" -ForegroundColor Green
