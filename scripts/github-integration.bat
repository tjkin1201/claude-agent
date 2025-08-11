@echo off
:: Claude Code + GitHub 완전 통합 (Windows 버전)
:: 생성일: 2024-08-09

setlocal enabledelayedexpansion
chcp 65001 >nul
color 0B

:: 로고 출력
echo.
echo ╔════════════════════════════════════════╗
echo ║   Claude Code + GitHub Integration    ║
echo ║        Complete Automation Suite      ║
echo ╚════════════════════════════════════════╝
echo.

:menu
echo.
echo === GitHub 통합 메뉴 ===
echo 1) 📝 Issue를 코드로 변환
echo 2) 🔄 자동 PR 생성
echo 3) 👀 PR 자동 리뷰
echo 4) 🐛 Issue 자동 수정
echo 5) 📊 코드 품질 분석
echo 6) 🚀 릴리스 자동화
echo 7) 📈 프로젝트 상태 리포트
echo 8) 🔧 빠른 작업
echo 9) 📚 도움말
echo 0) 종료
echo.
set /p choice="선택: "

if "%choice%"=="1" goto issue_to_code
if "%choice%"=="2" goto create_pr
if "%choice%"=="3" goto review_pr
if "%choice%"=="4" goto fix_issue
if "%choice%"=="5" goto quality_analysis
if "%choice%"=="6" goto release
if "%choice%"=="7" goto status_report
if "%choice%"=="8" goto quick_actions
if "%choice%"=="9" goto help
if "%choice%"=="0" exit /b

goto menu

:issue_to_code
echo.
set /p issue_num="Issue 번호 입력: "
echo Issue #%issue_num% 정보를 가져오는 중...

:: Issue 정보 가져오기
for /f "delims=" %%i in ('gh issue view %issue_num% --json title -q .title') do set issue_title=%%i
for /f "delims=" %%i in ('gh issue view %issue_num% --json body -q .body') do set issue_body=%%i

echo Issue 제목: %issue_title%
echo.
echo Claude가 구현을 시작합니다...

:: 브랜치 생성
git checkout -b issue-%issue_num%

:: Claude로 구현 (임시 파일 사용)
echo Issue #%issue_num%: %issue_title% > temp_issue.txt
echo. >> temp_issue.txt
echo %issue_body% >> temp_issue.txt

claude --allowedTools "Write" "Edit" "Read" "Bash(npm test)" < temp_issue.txt

:: 커밋
git add .
git commit -m "fix: Resolve issue #%issue_num% - %issue_title%"

del temp_issue.txt

echo.
set /p create_pr_choice="PR을 생성하시겠습니까? (y/n): "
if /i "%create_pr_choice%"=="y" goto create_pr_from_issue

goto menu

:create_pr_from_issue
:: PR 생성
gh pr create ^
    --title "🔧 Fix #%issue_num%: %issue_title%" ^
    --body "Closes #%issue_num%" ^
    --label "automated,enhancement"

echo ✅ PR이 생성되었습니다!
pause
goto menu

:create_pr
echo.
set /p pr_title="PR 제목: "
set /p pr_body="PR 설명: "

gh pr create --title "%pr_title%" --body "%pr_body%" --label "automated"
echo ✅ PR이 생성되었습니다!
pause
goto menu

:review_pr
echo.
set /p pr_num="PR 번호 입력 (또는 'current'): "

if "%pr_num%"=="current" (
    for /f %%i in ('gh pr view --json number -q .number') do set pr_num=%%i
)

echo PR #%pr_num%를 분석하는 중...

:: PR diff를 파일로 저장
gh pr diff %pr_num% > pr_diff.txt

:: Claude로 리뷰
claude --allowedTools "Read" ^
    "다음 PR을 리뷰해주세요: " < pr_diff.txt > review.md

:: 리뷰 게시
gh pr review %pr_num% --comment --body-file review.md

del pr_diff.txt
del review.md

echo ✅ 리뷰가 게시되었습니다!
pause
goto menu

:fix_issue
echo.
set /p issue_num="수정할 Issue 번호: "
call :issue_to_code
goto menu

:quality_analysis
echo.
echo 코드 품질을 분석하는 중...

claude --allowedTools "Read" "Write(reports/quality-report.md)" ^
    "/analyze --comprehensive"

echo ✅ 분석 완료! reports/quality-report.md를 확인하세요.

set /p create_issue="품질 이슈를 생성하시겠습니까? (y/n): "
if /i "%create_issue%"=="y" (
    gh issue create ^
        --title "🔍 코드 품질 개선 필요 - %date%" ^
        --body-file reports/quality-report.md ^
        --label "quality,automated"
    echo ✅ 이슈가 생성되었습니다!
)

pause
goto menu

:release
echo.
:: 현재 버전 확인
for /f %%i in ('git describe --tags --abbrev^=0 2^>nul') do set current_ver=%%i
if "%current_ver%"=="" set current_ver=v0.0.0

echo 현재 버전: %current_ver%
set /p new_ver="새 버전 (예: v1.0.1): "

:: 변경사항 수집
git log %current_ver%..HEAD --pretty=format:"- %%s" > changelog.txt

:: 태그 생성
git tag -a "%new_ver%" -m "Release %new_ver%"
git push origin "%new_ver%"

:: GitHub 릴리스 생성
gh release create "%new_ver%" ^
    --title "Release %new_ver%" ^
    --notes-file changelog.txt ^
    --latest

del changelog.txt

echo ✅ 릴리스 %new_ver%가 생성되었습니다!
pause
goto menu

:status_report
echo.
echo 프로젝트 상태를 분석하는 중...

:: 통계 수집
for /f %%i in ('gh issue list --state open --json number --jq ". | length"') do set open_issues=%%i
for /f %%i in ('gh pr list --state open --json number --jq ". | length"') do set open_prs=%%i

echo.
echo === 프로젝트 상태 ===
echo 🐛 열린 이슈: %open_issues%개
echo 🔄 열린 PR: %open_prs%개
echo.
echo === 최근 이슈 (5개) ===
gh issue list --limit 5

echo.
echo === 최근 PR (5개) ===
gh pr list --limit 5

pause
goto menu

:quick_actions
echo.
echo === 빠른 작업 ===
echo 1) 현재 브랜치 PR 생성
echo 2) 모든 테스트 실행
echo 3) 의존성 업데이트
echo 4) 커밋 & 푸시
echo 0) 뒤로
echo.
set /p quick_choice="선택: "

if "%quick_choice%"=="1" (
    gh pr create --fill
    echo ✅ PR이 생성되었습니다!
)
if "%quick_choice%"=="2" (
    npm test
)
if "%quick_choice%"=="3" (
    npm update
    git add package*.json
    git commit -m "chore: Update dependencies"
)
if "%quick_choice%"=="4" (
    git add .
    set /p commit_msg="커밋 메시지: "
    git commit -m "!commit_msg!"
    git push
)

pause
goto menu

:help
echo.
echo === Claude Code + GitHub 통합 도움말 ===
echo.
echo 주요 기능:
echo • Issue를 코드로: GitHub Issue를 읽고 자동으로 코드 구현
echo • 자동 PR: 구현된 코드로 Pull Request 자동 생성
echo • 코드 리뷰: PR의 코드를 Claude가 자동 리뷰
echo • 품질 분석: 전체 코드베이스 품질 점검
echo.
echo 사용 팁:
echo 1. Issue를 자세히 작성할수록 더 정확한 구현 가능
echo 2. PR 리뷰는 'current'를 입력하면 현재 브랜치의 PR 리뷰
echo 3. 정기적인 품질 분석으로 기술 부채 관리
echo.
echo 문제 해결:
echo • GitHub CLI 인증: gh auth login
echo • 권한 문제: gh auth refresh
echo.
pause
goto menu