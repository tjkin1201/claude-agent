@echo off
:: Claude Code + GitHub 빠른 시작 스크립트
:: 한 줄 명령으로 GitHub 작업 자동화

setlocal enabledelayedexpansion
chcp 65001 >nul

if "%1"=="" goto help

:: 명령어 라우팅
if /i "%1"=="issue" goto issue
if /i "%1"=="pr" goto pr
if /i "%1"=="review" goto review
if /i "%1"=="test" goto test
if /i "%1"=="release" goto release
if /i "%1"=="status" goto status
if /i "%1"=="setup" goto setup
goto help

:issue
:: Issue를 코드로 변환
if "%2"=="" (
    echo 사용법: quick-start issue [issue-number]
    exit /b 1
)
echo 🔄 Issue #%2를 구현 중...
gh issue view %2 --json title,body -q ".title,.body" > temp_issue.txt
claude --allowedTools "Write" "Edit" "Read" "Bash(npm test)" < temp_issue.txt
del temp_issue.txt
git add .
git commit -m "feat: Implement issue #%2"
echo ✅ 완료! PR을 생성하려면: quick-start pr
goto end

:pr
:: 현재 브랜치로 PR 생성
echo 🔄 PR 생성 중...
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set branch=%%i
gh pr create --fill --base main --head %branch%
echo ✅ PR이 생성되었습니다!
goto end

:review
:: PR 리뷰
if "%2"=="" (
    :: 현재 PR 리뷰
    for /f %%i in ('gh pr view --json number -q .number') do set pr_num=%%i
) else (
    set pr_num=%2
)
echo 🔄 PR #!pr_num! 리뷰 중...
gh pr diff !pr_num! | claude --allowedTools "Read" "/review" > review.md
gh pr comment !pr_num! --body-file review.md
del review.md
echo ✅ 리뷰가 게시되었습니다!
goto end

:test
:: 테스트 실행 및 개선
echo 🔄 테스트 실행 및 개선 중...
claude --allowedTools "Read" "Write(test/**)" "/test --improve"
npm test
echo ✅ 테스트 완료!
goto end

:release
:: 릴리스 생성
echo 🔄 릴리스 준비 중...
for /f %%i in ('git describe --tags --abbrev^=0 2^>nul') do set last_tag=%%i
if "!last_tag!"=="" set last_tag=v0.0.0
git log !last_tag!..HEAD --pretty=format:"- %%s" > changelog.txt
claude --allowedTools "Read" "Write" < changelog.txt > RELEASE_NOTES.md
del changelog.txt
echo 새 버전 태그 (예: v1.0.0):
set /p new_tag=
git tag -a !new_tag! -m "Release !new_tag!"
git push origin !new_tag!
gh release create !new_tag! --notes-file RELEASE_NOTES.md
del RELEASE_NOTES.md
echo ✅ 릴리스 !new_tag! 생성 완료!
goto end

:status
:: 프로젝트 상태 확인
echo 📊 프로젝트 상태
echo ================
gh issue list --limit 5
echo.
gh pr list --limit 5
echo.
git status --short
goto end

:setup
:: 초기 설정
echo 🔧 GitHub 통합 설정 중...
gh auth status >nul 2>&1
if errorlevel 1 (
    echo GitHub CLI 인증이 필요합니다.
    gh auth login
)
echo ✅ 설정 완료!
echo.
echo 사용 가능한 명령어:
echo   quick-start issue [번호]  - Issue 구현
echo   quick-start pr            - PR 생성
echo   quick-start review [번호] - PR 리뷰
echo   quick-start test          - 테스트 실행
echo   quick-start release       - 릴리스 생성
echo   quick-start status        - 상태 확인
goto end

:help
echo.
echo Claude Code + GitHub 빠른 시작
echo ================================
echo.
echo 사용법: quick-start [명령] [옵션]
echo.
echo 명령어:
echo   issue [번호]   - Issue를 코드로 구현
echo   pr            - 현재 브랜치로 PR 생성
echo   review [번호] - PR 자동 리뷰 (번호 생략시 현재 PR)
echo   test          - 테스트 실행 및 개선
echo   release       - 새 릴리스 생성
echo   status        - 프로젝트 상태 확인
echo   setup         - 초기 설정
echo.
echo 예제:
echo   quick-start issue 123     # Issue #123 구현
echo   quick-start pr            # PR 생성
echo   quick-start review        # 현재 PR 리뷰
echo   quick-start release       # 릴리스 생성
echo.

:end
endlocal