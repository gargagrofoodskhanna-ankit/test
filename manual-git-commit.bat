@echo off
echo ========================================
echo Manual Git Commit and Push Script
echo ========================================
echo.

echo Step 1: Checking current git status...
git status --porcelain
echo.

echo Step 2: Adding all changes to staging area...
git add .
echo.

echo Step 3: Checking what will be committed...
git diff --cached --name-only
echo.

echo Step 4: Committing changes...
git commit -m "Update grain procurement system with latest changes"
echo.

echo Step 5: Pushing to repository...
git push origin main
echo.

echo ========================================
echo Process completed!
echo ========================================
pause
