@echo off
rem Commits and pushes the website repository. Double-click. Output in git.log.
rem 13 Nov 2026: finds the git that comes with GitHub Desktop when git is not on the PATH.
setlocal enabledelayedexpansion
cd /d "%~dp0"
echo ==== %date% %time% > git.log
set "GIT="
where git >nul 2>&1 && set "GIT=git"
if not defined GIT (
  for /d %%d in ("%LOCALAPPDATA%\GitHubDesktop\app-*") do (
    if exist "%%d\resources\app\git\cmd\git.exe" set "GIT=%%d\resources\app\git\cmd\git.exe"
  )
)
if not defined GIT if exist "%ProgramFiles%\Git\cmd\git.exe" set "GIT=%ProgramFiles%\Git\cmd\git.exe"
if not defined GIT (
  echo STOP: git was not found on this PC. Nothing was committed. Tell Claude.
  echo STOP git not found >> git.log
  pause & exit /b 1
)
echo Using git: !GIT! >> git.log
"!GIT!" add -A >> git.log 2>&1
"!GIT!" status --short >> git.log 2>&1
"!GIT!" commit -m "Website: eight countries, name Boat & Berth (%date%)" >> git.log 2>&1
"!GIT!" push >> git.log 2>&1
if errorlevel 1 (echo Push FAILED, see git.log. Tell Claude. & pause & exit /b 1)
echo PUSH OK >> git.log
echo Done: committed and pushed.
pause
