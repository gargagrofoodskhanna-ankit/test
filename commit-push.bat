@echo off
echo Adding changes...
git add index.html
echo Committing changes...
git commit -m "Fix inventoryReport reference error and clean up reports section"
echo Pushing to repository...
git push origin main
echo Done!
pause

