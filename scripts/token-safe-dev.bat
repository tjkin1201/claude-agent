@echo off
REM Token-Safe Development Commands
REM 토큰 안전 개발 명령어 모음

echo 🤖 Token-Safe Development System

if "%1"=="start" (
    echo 🚀 개발 시작 - 토큰 효율성 모드
    powershell -ExecutionPolicy Bypass -File "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action start -Project yameyame
    goto :end
)

if "%1"=="check" (
    echo 📊 토큰 사용량 체크
    powershell -ExecutionPolicy Bypass -File "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action check -Project yameyame
    goto :end
)

if "%1"=="save" (
    echo 💾 작업 저장 및 GitHub 백업
    powershell -ExecutionPolicy Bypass -File "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action save -Project yameyame
    goto :end
)

if "%1"=="end" (
    echo 🏁 개발 종료 - 자동 백업
    powershell -ExecutionPolicy Bypass -File "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action end -Project yameyame
    goto :end
)

if "%1"=="backup" (
    echo ⚡ 강제 백업 실행
    cd "C:\Users\taejo\yameyame"
    powershell -ExecutionPolicy Bypass -File "auto-backup-system.ps1" -ForceBackup
    goto :end
)

if "%1"=="quick" (
    echo ⚡ 빠른 백업 실행
    cd "C:\Users\taejo\yameyame"
    powershell -ExecutionPolicy Bypass -File "auto-backup-system.ps1" -ForceBackup -QuickMode
    goto :end
)

REM 도움말 표시
echo.
echo 📋 사용 가능한 명령어:
echo.
echo   token-safe-dev start   - 개발 세션 시작
echo   token-safe-dev check   - 토큰 사용량 확인  
echo   token-safe-dev save    - 작업 저장 및 백업
echo   token-safe-dev end     - 개발 세션 종료
echo   token-safe-dev backup  - 강제 백업 실행
echo   token-safe-dev quick   - 빠른 백업
echo.
echo 💡 토큰 75%% 사용 시 자동 백업 권장!

:end