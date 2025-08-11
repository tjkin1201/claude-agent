# 스마트 AutoRun - 토큰 효율성 기반 개발 자동화
# Smart AutoRun with Token Management

param(
    [string]$Action = "check",  # check, start, save, end
    [string]$Project = "",
    [switch]$ForceUpload,
    [switch]$QuickMode,
    [string]$TokenLimit = "75"
)

function Get-ProjectPath {
    param([string]$ProjectName)
    
    # 일반적인 프로젝트 경로들 확인
    $commonPaths = @(
        "C:\Users\taejo\$ProjectName",
        "C:\Users\taejo\projects\$ProjectName", 
        "C:\Users\taejo\dev\$ProjectName",
        "C:\Users\taejo\yameyame"  # 특별 경로
    )
    
    foreach ($path in $commonPaths) {
        if (Test-Path $path) {
            return $path
        }
    }
    
    return $PWD.Path
}

function Estimate-Tokens {
    param([string]$ProjectPath)
    
    try {
        Set-Location $ProjectPath
        
        # 파일 수 기반 토큰 추정
        $files = Get-ChildItem -Recurse -File | Where-Object {
            $_.Extension -match '\.(md|js|ts|tsx|jsx|py|json|txt|yml|yaml)$' -and
            $_.FullName -notmatch '(node_modules|\.git|\.expo|build|dist)'
        }
        
        $recentChanges = 0
        try {
            $recentChanges = (git diff --name-only HEAD~1 2>$null | Measure-Object).Count
        } catch {}
        
        $baseTokens = $files.Count * 30  # 파일당 평균 30토큰
        $changeTokens = $recentChanges * 100  # 변경된 파일당 100토큰
        $overhead = 500  # 기본 오버헤드
        
        return $baseTokens + $changeTokens + $overhead
        
    } catch {
        return 2000  # 추정 실패 시 기본값
    }
}

function Smart-Backup {
    param([string]$ProjectPath, [string]$Reason = "auto")
    
    Set-Location $ProjectPath
    
    Write-Host "💾 스마트 백업 시작..." -ForegroundColor Green
    
    # 타임스탬프
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
    
    # 간단한 스냅샷 생성
    $snapshot = @"
# 📸 개발 스냅샷 - $timestamp

## 백업 사유: $Reason
- 시각: $(Get-Date)
- 브랜치: $(git branch --show-current 2>$null)
- 마지막 커밋: $(git log -1 --oneline 2>$null)

## 변경사항
$(git status --porcelain 2>$null | Out-String)

다음 세션에서 작업 계속...
"@

    $snapshot | Out-File -FilePath "snapshot_$timestamp.md" -Encoding UTF8
    
    # Git 작업
    git add . 2>$null
    git commit -m "save: Smart backup - $Reason ($timestamp)" 2>$null
    git push origin main 2>$null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ 백업 완료!" -ForegroundColor Green
    } else {
        Write-Host "⚠️  백업 일부 실패 (Git 설정 확인 필요)" -ForegroundColor Yellow
    }
}

# 메인 로직
$projectPath = if ($Project) { Get-ProjectPath $Project } else { $PWD.Path }
Set-Location $projectPath

Write-Host "🤖 Smart AutoRun - 토큰 효율성 관리" -ForegroundColor Cyan
Write-Host "📁 프로젝트: $projectPath" -ForegroundColor Yellow

$estimatedTokens = Estimate-Tokens $projectPath
$tokenPercentage = [math]::Min(100, ($estimatedTokens / 8000) * 100)

Write-Host "📊 예상 토큰 사용량: $estimatedTokens ($([math]::Round($tokenPercentage, 1))%)" -ForegroundColor Yellow

switch ($Action.ToLower()) {
    "check" {
        Write-Host "🔍 현재 상태 확인 중..." -ForegroundColor Green
        
        if ($tokenPercentage -ge $TokenLimit) {
            Write-Host "⚠️  토큰 임계값 도달! 백업을 권장합니다." -ForegroundColor Red
            Write-Host "💡 실행: smart-autorun.ps1 -Action save" -ForegroundColor Yellow
        } else {
            Write-Host "✅ 토큰 사용량 양호. 계속 작업 가능합니다." -ForegroundColor Green
        }
    }
    
    "start" {
        Write-Host "🚀 개발 세션 시작..." -ForegroundColor Green
        Write-Host "📋 이전 스냅샷 확인 중..." -ForegroundColor Yellow
        
        $latestSnapshot = Get-ChildItem -Name "snapshot_*.md" -ErrorAction SilentlyContinue | 
                         Sort-Object CreationTime -Descending | 
                         Select-Object -First 1
        
        if ($latestSnapshot) {
            Write-Host "📄 마지막 스냅샷: $latestSnapshot" -ForegroundColor Cyan
            Write-Host "💡 개발을 계속 진행하세요!" -ForegroundColor Green
        } else {
            Write-Host "🆕 새로운 개발 세션입니다." -ForegroundColor Green
        }
    }
    
    "save" {
        Write-Host "💾 작업 저장 및 백업..." -ForegroundColor Green
        Smart-Backup $projectPath "manual-save"
    }
    
    "end" {
        Write-Host "🏁 개발 세션 종료..." -ForegroundColor Green
        Smart-Backup $projectPath "session-end"
    }
    
    default {
        Write-Host "❓ 알 수 없는 액션: $Action" -ForegroundColor Red
        Write-Host "사용 가능한 액션: check, start, save, end" -ForegroundColor Yellow
    }
}

# 자동 백업 확인
if ($tokenPercentage -ge $TokenLimit -and $Action -ne "save" -and $Action -ne "end") {
    Write-Host "`n🚨 토큰 임계값 도달! 자동 백업을 실행하시겠습니까? (Y/n)" -ForegroundColor Red
    $response = Read-Host
    if ($response -eq "" -or $response.ToLower() -eq "y") {
        Smart-Backup $projectPath "auto-token-limit"
    }
}

Write-Host "`n📋 다음 명령어들:" -ForegroundColor Yellow  
Write-Host "- 작업 시작: smart-autorun.ps1 -Action start" -ForegroundColor White
Write-Host "- 상태 확인: smart-autorun.ps1 -Action check" -ForegroundColor White
Write-Host "- 백업 저장: smart-autorun.ps1 -Action save" -ForegroundColor White
Write-Host "- 세션 종료: smart-autorun.ps1 -Action end" -ForegroundColor White