@echo off
echo ========================================
echo Git Configuration Reset Script
echo ========================================
echo.

echo Step 1: Resetting git pager settings...
git config --global core.pager ""
git config --global core.autocrlf true
git config --global core.safecrlf false
echo.

echo Step 2: Setting up git for Windows...
git config --global core.editor "notepad"
git config --global init.defaultBranch main
echo.

echo Step 3: Testing git commands...
echo Testing git status...
git status --porcelain
echo.

echo Testing git log...
git log --oneline -1
echo.

echo ========================================
echo Git configuration reset completed!
echo ========================================
pause

