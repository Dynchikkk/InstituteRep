@echo off
setlocal
cd /d "%~dp0.."

rem Create the local environment if it does not exist yet.
if not exist ".venv\Scripts\python.exe" (
    py -3.14 -m venv .venv
    if errorlevel 1 (
        pause
        exit /b 1
    )
)

rem Install the same dependency versions as in the project.
".venv\Scripts\python.exe" -m pip install "Django==5.2.19" "Pillow==13.0.0"
set "result=%errorlevel%"
pause
exit /b %result%
