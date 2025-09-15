@echo off
echo Starting git operations...
echo.

echo Adding all files...
git add . 2>nul
if %errorlevel% neq 0 (
    echo Error adding files
    pause
    exit /b 1
)

echo.
echo Committing changes...
git commit -m "Update grain procurement system with latest changes" 2>nul
if %errorlevel% neq 0 (
    echo No changes to commit or commit failed
    pause
    exit /b 1
)

echo.
echo Pushing to repository...
git push origin main 2>nul
if %errorlevel% neq 0 (
    echo Push failed
    pause
    exit /b 1
)

echo.
echo Successfully committed and pushed changes!
pause
