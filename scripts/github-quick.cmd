@echo off
:: Claude GitHub Integration - Simple Commands
setlocal

if "%1"=="" goto help

if /i "%1"=="help" goto help
if /i "%1"=="status" goto status
if /i "%1"=="issue" goto issue
if /i "%1"=="pr" goto pr
if /i "%1"=="setup" goto setup
goto help

:help
echo.
echo Claude Code + GitHub Integration
echo ===============================
echo.
echo Usage: github-quick [command] [options]
echo.
echo Commands:
echo   status      - Show project status
echo   issue [num] - View issue details
echo   pr          - Create pull request
echo   setup       - Setup GitHub integration
echo.
goto end

:status
echo Project Status:
echo ===============
gh issue list --limit 3 2>nul
echo.
gh pr list --limit 3 2>nul
echo.
git status --short 2>nul
goto end

:issue
if "%2"=="" (
    echo Usage: github-quick issue [number]
    echo Example: github-quick issue 123
    exit /b 1
)
echo Issue #%2 Details:
echo =================
gh issue view %2 2>nul
goto end

:pr
echo Creating Pull Request...
echo =======================
gh pr create --fill 2>nul
if errorlevel 1 (
    echo Error: Failed to create PR
    echo Make sure you have changes to commit and push
)
goto end

:setup
echo GitHub Integration Setup
echo =======================
gh auth status 2>nul
if errorlevel 1 (
    echo Please login to GitHub CLI:
    gh auth login
) else (
    echo GitHub CLI is already authenticated
)
echo.
echo Setup complete!
goto end

:end