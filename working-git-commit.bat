@echo off
echo ========================================
echo Working Git Commit Script
echo ========================================
echo.

REM Disable git pager completely
set GIT_PAGER=
set GIT_CONFIG_GLOBAL=

echo Step 1: Adding files...
git add . 2>nul
if %errorlevel% neq 0 (
    echo Error adding files
    pause
    exit /b 1
)
echo Files added successfully!

echo.
echo Step 2: Checking what will be committed...
git diff --cached --name-only 2>nul
echo.

echo Step 3: Committing changes...
git commit -m "Update grain procurement system with latest changes" 2>nul
if %errorlevel% neq 0 (
    echo No changes to commit or commit failed
    echo Checking status...
    git status --porcelain 2>nul
    pause
    exit /b 1
)
echo Commit successful!

echo.
echo Step 4: Pushing to repository...
git push origin main 2>nul
if %errorlevel% neq 0 (
    echo Push failed
    pause
    exit /b 1
)
echo Push successful!

echo.
echo ========================================
echo All operations completed successfully!
echo ========================================
pause

