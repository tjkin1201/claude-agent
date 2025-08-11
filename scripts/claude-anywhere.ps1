# Claude Code - 어느 프로젝트에서든 사용 가능한 스크립트
# 사용법: claude-anywhere [command] [options]

param(
    [Parameter(Position=0)]
    [string]$Command,
    
    [Parameter(Position=1)]
    [string]$Argument,
    
    [Parameter()]
    [string]$ProjectPath = (Get-Location)
)

# 현재 프로젝트 경로 감지
$currentPath = $ProjectPath
$projectName = Split-Path -Leaf $currentPath

function Write-ColorText {
    param($Text, $Color = "White")
    Write-Host $Text -ForegroundColor $Color
}

function Get-ProjectType {
    $projectType = "unknown"
    
    if (Test-Path "package.json") { $projectType = "nodejs" }
    elseif (Test-Path "requirements.txt") { $projectType = "python" }
    elseif (Test-Path "Cargo.toml") { $projectType = "rust" }
    elseif (Test-Path "go.mod") { $projectType = "go" }
    elseif (Test-Path "*.sln") { $projectType = "dotnet" }
    elseif (Test-Path "pom.xml") { $projectType = "java" }
    
    return $projectType
}

function Show-ProjectInfo {
    $projectType = Get-ProjectType
    
    Write-ColorText "`n📁 프로젝트 정보" "Cyan"
    Write-ColorText "==================" "Cyan"
    Write-ColorText "경로: $currentPath" "White"
    Write-ColorText "이름: $projectName" "White"
    Write-ColorText "타입: $projectType" "White"
    Write-ColorText ""
}

function Invoke-SmartStatus {
    Show-ProjectInfo
    
    Write-ColorText "📊 Git 상태:" "Yellow"
    git status --short
    
    Write-ColorText "`n🐛 GitHub Issues:" "Yellow"
    gh issue list --limit 3 2>$null
    
    Write-ColorText "`n🔄 Pull Requests:" "Yellow"
    gh pr list --limit 3 2>$null
    
    $projectType = Get-ProjectType
    
    # 프로젝트별 맞춤 상태 체크
    switch ($projectType) {
        "nodejs" {
            Write-ColorText "`n📦 NPM 패키지:" "Yellow"
            if (Test-Path "package.json") {
                $package = Get-Content "package.json" | ConvertFrom-Json
                Write-Host "  이름: $($package.name)"
                Write-Host "  버전: $($package.version)"
            }
        }
        "python" {
            Write-ColorText "`n🐍 Python 환경:" "Yellow"
            python --version 2>$null
        }
        "rust" {
            Write-ColorText "`n🦀 Rust 프로젝트:" "Yellow"
            cargo --version 2>$null
        }
    }
}

function Invoke-SmartIssue {
    param($IssueNumber)
    
    if (-not $IssueNumber) {
        Write-ColorText "사용법: claude-anywhere issue [issue-number]" "Red"
        return
    }
    
    Show-ProjectInfo
    Write-ColorText "🔄 Issue #$IssueNumber 구현 중..." "Yellow"
    
    try {
        $projectType = Get-ProjectType
        
        # Issue 정보 가져오기
        $issueTitle = gh issue view $IssueNumber --json title -q .title
        $issueBody = gh issue view $IssueNumber --json body -q .body
        
        # 프로젝트 타입별 맞춤 프롬프트
        $contextPrompt = switch ($projectType) {
            "nodejs" { "Node.js/JavaScript 프로젝트입니다. package.json을 참고해서 사용 중인 프레임워크에 맞게 구현해주세요." }
            "python" { "Python 프로젝트입니다. requirements.txt를 참고해서 사용 중인 라이브러리에 맞게 구현해주세요." }
            "rust" { "Rust 프로젝트입니다. Cargo.toml을 참고해서 적절한 크레이트를 사용해주세요." }
            default { "프로젝트 구조를 분석해서 적절한 방식으로 구현해주세요." }
        }
        
        # 임시 파일에 Issue 내용 저장
        $issueContent = @"
프로젝트: $projectName ($projectType)
경로: $currentPath

Issue #$IssueNumber: $issueTitle

$issueBody

구현 컨텍스트:
$contextPrompt

구현 요구사항:
1. 이슈 내용에 맞는 코드 구현
2. 프로젝트 타입에 맞는 테스트 케이스 작성
3. 필요시 문서 업데이트
"@
        
        $issueContent | Out-File -FilePath "temp_issue.txt" -Encoding UTF8
        
        # Claude로 구현 (프로젝트별 허용 도구 설정)
        $allowedTools = switch ($projectType) {
            "nodejs" { "Write", "Edit", "Read", "Bash(npm test)", "Bash(npm run build)" }
            "python" { "Write", "Edit", "Read", "Bash(python -m pytest)", "Bash(pip install)" }
            "rust" { "Write", "Edit", "Read", "Bash(cargo test)", "Bash(cargo build)" }
            default { "Write", "Edit", "Read" }
        }
        
        claude --allowedTools $allowedTools < temp_issue.txt
        
        # 정리
        Remove-Item "temp_issue.txt" -ErrorAction SilentlyContinue
        
        # Git 커밋
        git add .
        git commit -m "feat: Implement issue #$IssueNumber - $issueTitle`n`nProject: $projectName`nPath: $currentPath"
        
        Write-ColorText "✅ 완료! PR을 생성하려면: claude-anywhere pr" "Green"
    }
    catch {
        Write-ColorText "❌ 오류 발생: $($_.Exception.Message)" "Red"
    }
}

function Invoke-SmartAnalysis {
    Show-ProjectInfo
    Write-ColorText "🔍 프로젝트 분석 중..." "Yellow"
    
    $projectType = Get-ProjectType
    
    $analysisPrompt = @"
현재 프로젝트를 분석해주세요:

프로젝트 정보:
- 이름: $projectName
- 경로: $currentPath
- 타입: $projectType

분석 요청:
1. 현재 구현 상태 파악
2. 미완성 기능 식별
3. 다음 우선순위 작업 제안
4. 개선이 필요한 부분 지적
5. 테스트 커버리지 상태

결과를 PROJECT_ANALYSIS.md 파일로 저장해주세요.
"@
    
    try {
        $analysisPrompt | claude --allowedTools "Read", "Write(PROJECT_ANALYSIS.md)" 
        Write-ColorText "✅ 분석 결과가 PROJECT_ANALYSIS.md에 저장되었습니다!" "Green"
    }
    catch {
        Write-ColorText "❌ 분석 실패: $($_.Exception.Message)" "Red"
    }
}

function Show-Help {
    Write-ColorText "`nClaude Code - 어디서든 사용 가능" "Cyan"
    Write-ColorText "===============================" "Cyan"
    Write-ColorText ""
    Write-ColorText "사용법: claude-anywhere [명령] [옵션]" "Yellow"
    Write-ColorText ""
    Write-ColorText "명령어:" "Green"
    Write-ColorText "  status              - 프로젝트 상태 확인 (Git + GitHub + 프로젝트 정보)" "White"
    Write-ColorText "  issue [번호]        - Issue를 프로젝트에 맞게 구현" "White"
    Write-ColorText "  pr                  - 현재 브랜치로 PR 생성" "White"
    Write-ColorText "  analyze             - 프로젝트 전체 분석" "White"
    Write-ColorText "  daily-summary       - 오늘 작업 요약" "White"
    Write-ColorText "  plan-tomorrow       - 내일 계획 생성" "White"
    Write-ColorText ""
    Write-ColorText "예제:" "Green"
    Write-ColorText "  claude-anywhere status           # 현재 프로젝트 상태" "Gray"
    Write-ColorText "  claude-anywhere issue 123       # Issue #123 구현" "Gray"
    Write-ColorText "  claude-anywhere analyze          # 프로젝트 분석" "Gray"
}

function Invoke-DailySummary {
    Show-ProjectInfo
    Write-ColorText "📋 오늘 작업 요약 생성 중..." "Yellow"
    
    $summaryPrompt = @"
오늘 작업한 내용을 요약해주세요:

프로젝트: $projectName
경로: $currentPath

분석 대상:
1. 오늘의 Git 커밋 내역
2. 수정된 파일들
3. 진행 중인 작업 상태

다음 형식으로 작성해주세요:
# 📅 $(Get-Date -Format 'yyyy-MM-dd') 작업 요약 - $projectName

## ✅ 완료한 작업
## 🔄 진행 중인 작업  
## 📋 내일 우선순위
## ⚠️ 해결 필요한 이슈

결과를 DAILY_SUMMARY_$(Get-Date -Format 'yyyyMMdd').md로 저장해주세요.
"@
    
    try {
        $fileName = "DAILY_SUMMARY_$(Get-Date -Format 'yyyyMMdd').md"
        $summaryPrompt | claude --allowedTools "Read", "Write($fileName)", "Bash(git log --since='1 day ago')"
        Write-ColorText "✅ 오늘 작업 요약이 $fileName에 저장되었습니다!" "Green"
    }
    catch {
        Write-ColorText "❌ 요약 생성 실패: $($_.Exception.Message)" "Red"
    }
}

# 메인 실행 로직
switch ($Command.ToLower()) {
    "status" { Invoke-SmartStatus }
    "issue" { Invoke-SmartIssue $Argument }
    "pr" { 
        gh pr create --fill 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-ColorText "✅ PR이 생성되었습니다!" "Green"
        } else {
            Write-ColorText "❌ PR 생성 실패. 커밋할 변경사항이 있는지 확인하세요." "Red"
        }
    }
    "analyze" { Invoke-SmartAnalysis }
    "daily-summary" { Invoke-DailySummary }
    "plan-tomorrow" {
        $planPrompt = @"
내일 작업 계획을 세워주세요:
프로젝트: $projectName

현재 상태를 분석하고 내일 할 일을 우선순위별로 정리해주세요.
TOMORROW_PLAN.md 파일로 저장해주세요.
"@
        $planPrompt | claude --allowedTools "Read", "Write(TOMORROW_PLAN.md)"
        Write-ColorText "✅ 내일 계획이 TOMORROW_PLAN.md에 저장되었습니다!" "Green"
    }
    default { Show-Help }
}