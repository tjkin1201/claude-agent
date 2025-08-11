@echo off
:: Claude Anywhere 자동 설정 스크립트
echo.
echo ======================================
echo    Claude Anywhere 자동 설정
echo ======================================
echo.

:: PATH 설정
echo 1. PATH 설정 중...
setx PATH "%PATH%;C:\Users\taejo\.claude\scripts" >nul 2>&1
if %ERRORLEVEL%==0 (
    echo ✅ PATH 설정 완료
) else (
    echo ❌ PATH 설정 실패
    pause
    exit /b 1
)

:: PowerShell 정책 설정
echo.
echo 2. PowerShell 실행 정책 설정 중...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force" >nul 2>&1
if %ERRORLEVEL%==0 (
    echo ✅ PowerShell 정책 설정 완료
) else (
    echo ❌ PowerShell 정책 설정 실패
)

:: GitHub CLI 확인
echo.
echo 3. GitHub CLI 상태 확인 중...
gh auth status >nul 2>&1
if %ERRORLEVEL%==0 (
    echo ✅ GitHub CLI 인증됨
) else (
    echo ⚠️  GitHub CLI 인증 필요
    echo    나중에 'gh auth login' 실행하세요
)

echo.
echo ======================================
echo    설정 완료! 🎉
echo ======================================
echo.
echo 사용법:
echo   claude-anywhere status      # 현재 프로젝트 상태
echo   claude-anywhere issue 123   # Issue 구현
echo   claude-anywhere analyze     # 프로젝트 분석
echo.
echo ⚠️  새 명령 프롬프트를 열어서 테스트하세요!
echo.
pause