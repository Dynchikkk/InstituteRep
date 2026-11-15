@echo off
setlocal
cd /d "%~dp0.."

if not exist ".venv\Scripts\python.exe" (
    echo Run scripts\setup_env.bat first.
    pause
    exit /b 1
)

rem Open a terminal with the project environment activated.
call ".venv\Scripts\activate.bat"
cmd /k
