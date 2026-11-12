@echo off
rem Commits and pushes the website repository. Double-click. Output in git.log.
cd /d "%~dp0"
echo ==== %date% %time% > git.log
git add -A >> git.log 2>&1
git status --short >> git.log 2>&1
git commit -m "Website: privacy and terms without advertising, founders page removed" >> git.log 2>&1
git push >> git.log 2>&1
if errorlevel 1 (echo Push FAILED, see git.log. Tell Claude. & pause & exit /b 1)
echo PUSH OK >> git.log
echo Done: committed and pushed.
pause
