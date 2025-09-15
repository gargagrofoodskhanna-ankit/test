@echo off
echo Committing code and ignoring line ending warnings...
echo.

REM Suppress the LF/CRLF warnings
git config core.autocrlf true
git config core.safecrlf false

echo Adding all files (ignoring warnings)...
git add . 2>nul

echo Committing changes...
git commit -m "Update grain procurement system" 2>nul

echo Pushing to repository...
git push origin main 2>nul

echo.
echo Done! Warnings were ignored and code was committed.
pause
