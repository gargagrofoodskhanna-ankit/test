@echo off
echo Fixing Git line ending issues and committing code...
echo.

REM Configure git to handle line endings properly
git config core.autocrlf true
git config core.safecrlf false

echo Cleaning up any problematic files...
git add . --renormalize

echo Checking status...
git status --porcelain

echo Adding all files...
git add .

echo Committing changes...
git commit -m "Update grain procurement system - fix line endings"

echo Pushing to repository...
git push origin main

echo Done!
pause
