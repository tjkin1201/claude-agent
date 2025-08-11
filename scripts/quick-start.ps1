# Claude Code + GitHub PowerShell 통합 스크립트
# PowerShell 실행 정책: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

param(
    [Parameter(Position=0)]
    [string]$Command,
    
    [Parameter(Position=1)]
    [string]$Argument
)

# 색상 함수 정의
function Write-ColorText {
    param($Text, $Color = "White")
    Write-Host $Text -ForegroundColor $Color
}

function Show-Help {
    Write-ColorText "`nClaude Code + GitHub 빠른 시작" "Cyan"
    Write-ColorText "================================" "Cyan"
    Write-ColorText ""
    Write-ColorText "사용법: .\quick-start.ps1 [명령] [옵션]" "Yellow"
    Write-ColorText ""
    Write-ColorText "명령어:" "Green"
    Write-ColorText "  issue [번호]   - Issue를 코드로 구현" "White"
    Write-ColorText "  pr            - 현재 브랜치로 PR 생성" "White"
    Write-ColorText "  review [번호] - PR 자동 리뷰 (번호 생략시 현재 PR)" "White"
    Write-ColorText "  test          - 테스트 실행 및 개선" "White"
    Write-ColorText "  release       - 새 릴리스 생성" "White"
    Write-ColorText "  status        - 프로젝트 상태 확인" "White"
    Write-ColorText "  setup         - 초기 설정" "White"
    Write-ColorText ""
    Write-ColorText "예제:" "Green"
    Write-ColorText "  .\quick-start.ps1 issue 123     # Issue #123 구현" "Gray"
    Write-ColorText "  .\quick-start.ps1 pr            # PR 생성" "Gray"
    Write-ColorText "  .\quick-start.ps1 review        # 현재 PR 리뷰" "Gray"
    Write-ColorText "  .\quick-start.ps1 release       # 릴리스 생성" "Gray"
}

function Invoke-IssueToCode {
    param($IssueNumber)
    
    if (-not $IssueNumber) {
        Write-ColorText "사용법: .\quick-start.ps1 issue [issue-number]" "Red"
        return
    }
    
    Write-ColorText "🔄 Issue #$IssueNumber 구현 중..." "Yellow"
    
    try {
        # Issue 정보 가져오기
        $issueTitle = gh issue view $IssueNumber --json title -q .title
        $issueBody = gh issue view $IssueNumber --json body -q .body
        
        # 임시 파일에 Issue 내용 저장
        $issueContent = @"
Issue #$IssueNumber : $issueTitle

$issueBody

구현 요구사항:
1. 이슈 내용에 맞는 코드 구현
2. 테스트 케이스 작성
3. 문서 업데이트
"@
        
        $issueContent | Out-File -FilePath "temp_issue.txt" -Encoding UTF8
        
        # Claude로 구현
        claude --allowedTools "Write" "Edit" "Read" "Bash(npm test)" < temp_issue.txt
        
        # 정리
        Remove-Item "temp_issue.txt" -ErrorAction SilentlyContinue
        
        # Git 커밋
        git add .
        git commit -m "feat: Implement issue #$IssueNumber - $issueTitle"
        
        Write-ColorText "✅ 완료! PR을 생성하려면: .\quick-start.ps1 pr" "Green"
    }
    catch {
        Write-ColorText "❌ 오류 발생: $($_.Exception.Message)" "Red"
    }
}

function Invoke-CreatePR {
    Write-ColorText "🔄 PR 생성 중..." "Yellow"
    
    try {
        $currentBranch = git rev-parse --abbrev-ref HEAD
        gh pr create --fill --base main --head $currentBranch
        Write-ColorText "✅ PR이 생성되었습니다!" "Green"
    }
    catch {
        Write-ColorText "❌ PR 생성 실패: $($_.Exception.Message)" "Red"
    }
}

function Invoke-ReviewPR {
    param($PRNumber)
    
    try {
        if (-not $PRNumber) {
            # 현재 PR 번호 가져오기
            $PRNumber = gh pr view --json number -q .number
        }
        
        Write-ColorText "🔄 PR #$PRNumber 리뷰 중..." "Yellow"
        
        # PR diff 가져오기
        gh pr diff $PRNumber | Out-File -FilePath "pr_diff.txt" -Encoding UTF8
        
        # Claude로 리뷰
        $reviewContent = Get-Content "pr_diff.txt" -Raw
        $reviewPrompt = @"
다음 PR 변경사항을 리뷰해주세요:

$reviewContent

리뷰 포인트:
1. 코드 품질
2. 보안 이슈  
3. 성능 고려사항
4. 개선 제안

마크다운 형식으로 작성해주세요.
"@
        
        $reviewPrompt | claude --allowedTools "Read" | Out-File -FilePath "review.md" -Encoding UTF8
        
        # 리뷰 게시
        gh pr comment $PRNumber --body-file review.md
        
        # 정리
        Remove-Item "pr_diff.txt", "review.md" -ErrorAction SilentlyContinue
        
        Write-ColorText "✅ 리뷰가 게시되었습니다!" "Green"
    }
    catch {
        Write-ColorText "❌ 리뷰 실패: $($_.Exception.Message)" "Red"
    }
}

function Invoke-RunTests {
    Write-ColorText "🔄 테스트 실행 및 개선 중..." "Yellow"
    
    try {
        claude --allowedTools "Read" "Write(test/**)" "/test --improve"
        npm test
        Write-ColorText "✅ 테스트 완료!" "Green"
    }
    catch {
        Write-ColorText "❌ 테스트 실패: $($_.Exception.Message)" "Red"
    }
}

function Invoke-CreateRelease {
    Write-ColorText "🔄 릴리스 준비 중..." "Yellow"
    
    try {
        # 마지막 태그 가져오기
        $lastTag = git describe --tags --abbrev=0 2>$null
        if (-not $lastTag) { $lastTag = "v0.0.0" }
        
        Write-ColorText "현재 버전: $lastTag" "Gray"
        
        # 변경사항 수집
        $changelog = git log "$lastTag..HEAD" --pretty=format:"- %s"
        $changelog | Out-File -FilePath "changelog.txt" -Encoding UTF8
        
        # 릴리스 노트 생성
        $changelogContent = Get-Content "changelog.txt" -Raw
        $releasePrompt = @"
다음 변경사항으로 릴리스 노트를 생성해주세요:

$changelogContent

다음 형식으로 작성해주세요:
## 🎉 새로운 기능
## 🐛 버그 수정  
## 📚 문서 개선
## 🔧 기타 변경사항
"@
        
        $releasePrompt | claude --allowedTools "Read" "Write" | Out-File -FilePath "RELEASE_NOTES.md" -Encoding UTF8
        
        # 새 버전 입력
        $newTag = Read-Host "새 버전 태그 (예: v1.0.1)"
        
        # 태그 생성 및 푸시
        git tag -a $newTag -m "Release $newTag"
        git push origin $newTag
        
        # GitHub 릴리스 생성
        gh release create $newTag --notes-file RELEASE_NOTES.md
        
        # 정리
        Remove-Item "changelog.txt", "RELEASE_NOTES.md" -ErrorAction SilentlyContinue
        
        Write-ColorText "✅ 릴리스 $newTag 생성 완료!" "Green"
    }
    catch {
        Write-ColorText "❌ 릴리스 실패: $($_.Exception.Message)" "Red"
    }
}

function Show-ProjectStatus {
    Write-ColorText "📊 프로젝트 상태" "Cyan"
    Write-ColorText "=================" "Cyan"
    
    Write-ColorText "`n🐛 최근 이슈 (5개):" "Yellow"
    gh issue list --limit 5
    
    Write-ColorText "`n🔄 최근 PR (5개):" "Yellow"  
    gh pr list --limit 5
    
    Write-ColorText "`n📁 Git 상태:" "Yellow"
    git status --short
}

function Initialize-Setup {
    Write-ColorText "🔧 GitHub 통합 설정 중..." "Yellow"
    
    # GitHub CLI 인증 확인
    $authStatus = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-ColorText "GitHub CLI 인증이 필요합니다." "Red"
        gh auth login
    }
    
    Write-ColorText "✅ 설정 완료!" "Green"
    Write-ColorText ""
    Write-ColorText "사용 가능한 명령어:" "Green"
    Write-ColorText "  .\quick-start.ps1 issue [번호]  - Issue 구현" "White"
    Write-ColorText "  .\quick-start.ps1 pr            - PR 생성" "White"
    Write-ColorText "  .\quick-start.ps1 review [번호] - PR 리뷰" "White"
    Write-ColorText "  .\quick-start.ps1 test          - 테스트 실행" "White"
    Write-ColorText "  .\quick-start.ps1 release       - 릴리스 생성" "White"
    Write-ColorText "  .\quick-start.ps1 status        - 상태 확인" "White"
}

# 메인 실행 로직
switch ($Command.ToLower()) {
    "issue" { Invoke-IssueToCode $Argument }
    "pr" { Invoke-CreatePR }
    "review" { Invoke-ReviewPR $Argument }
    "test" { Invoke-RunTests }
    "release" { Invoke-CreateRelease }
    "status" { Show-ProjectStatus }
    "setup" { Initialize-Setup }
    default { Show-Help }
}