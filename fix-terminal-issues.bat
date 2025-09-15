@echo off
echo ========================================
echo Terminal Issues Fix Script
echo ========================================
echo.

echo Step 1: Killing any stuck processes...
taskkill /f /im python.exe 2>nul
taskkill /f /im node.exe 2>nul
taskkill /f /im cmd.exe 2>nul
taskkill /f /im powershell.exe 2>nul
echo.

echo Step 2: Clearing any log file locks...
if exist "*.log" del /f /q "*.log" 2>nul
if exist "nul" del /f /q "nul" 2>nul
echo.

echo Step 3: Testing basic commands...
echo Testing echo command...
echo Hello World
echo.

echo Step 4: Testing git status...
git --version
echo.

echo Step 5: Checking git status...
git status --porcelain
echo.

echo Step 6: Testing git add...
git add . --dry-run
echo.

echo ========================================
echo Terminal fix completed!
echo ========================================
pause

