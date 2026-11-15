@echo off
setlocal
cd /d "%~dp0.."

if not exist ".venv\Scripts\python.exe" (
    echo Run scripts\setup_env.bat first.
    pause
    exit /b 1
)

rem Start the development server; Ctrl+C stops it.
".venv\Scripts\python.exe" manage.py runserver %*
set "result=%errorlevel%"
pause
exit /b %result%
