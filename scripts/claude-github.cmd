@echo off
:: Claude GitHub 간단 래퍼
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Claude Code + GitHub 통합
    echo 사용법: claude-github [명령] [옵션]
    echo.
    echo 명령어:
    echo   status   - 프로젝트 상태 확인
    echo   issue N  - Issue #N 구현 
    echo   pr       - PR 생성
    echo   review   - PR 리뷰
    echo.
    exit /b
)

if /i "%1"=="status" (
    echo 📊 GitHub 상태 확인
    gh issue list --limit 3
    echo.
    gh pr list --limit 3  
    echo.
    git status --short
    exit /b
)

if /i "%1"=="issue" (
    if "%2"=="" (
        echo Issue 번호를 입력하세요: claude-github issue 123
        exit /b 1
    )
    echo Issue #%2 정보를 가져옵니다...
    gh issue view %2
    exit /b
)

if /i "%1"=="pr" (
    echo 현재 브랜치로 PR 생성...
    gh pr create --fill
    exit /b
)

if /i "%1"=="review" (
    echo PR 목록:
    gh pr list --limit 5
    exit /b
)

echo 알 수 없는 명령어: %1
echo claude-github 를 실행하면 도움말을 볼 수 있습니다.