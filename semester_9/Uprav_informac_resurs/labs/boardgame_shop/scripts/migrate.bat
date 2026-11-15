@echo off
setlocal
cd /d "%~dp0.."

if not exist ".venv\Scripts\python.exe" (
    echo Run scripts\setup_env.bat first.
    pause
    exit /b 1
)

rem Apply existing migrations to the database.
".venv\Scripts\python.exe" manage.py migrate %*
set "result=%errorlevel%"
pause
exit /b %result%
