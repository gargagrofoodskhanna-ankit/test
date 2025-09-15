@echo off
echo Checking git status...
git status --porcelain
echo.
echo Adding all changes...
git add -A
echo.
echo Committing changes...
git commit -m "Update grain procurement system with latest changes"
echo.
echo Pushing to repository...
git push origin main
echo.
echo Done!
pause
