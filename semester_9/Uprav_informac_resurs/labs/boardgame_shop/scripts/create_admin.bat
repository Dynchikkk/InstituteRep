@echo off
setlocal
cd /d "%~dp0.."

if not exist ".venv\Scripts\python.exe" (
    echo Run scripts\setup_env.bat first.
    pause
    exit /b 1
)

rem Create an administrator using the interactive Django prompts.
".venv\Scripts\python.exe" manage.py createsuperuser %*
set "result=%errorlevel%"
pause
exit /b %result%
