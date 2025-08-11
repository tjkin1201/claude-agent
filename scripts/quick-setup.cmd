@echo off
chcp 65001 >nul
cls
echo.
echo ======================================
echo    Claude Anywhere Quick Setup
echo ======================================
echo.
echo Running PowerShell setup script...
echo.
powershell -ExecutionPolicy Bypass -File "C:\Users\taejo\.claude\scripts\setup-anywhere.ps1"
echo.
echo Setup completed!
echo.
pause