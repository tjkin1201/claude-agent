# Claude Code 개발 래퍼 - 토큰 효율성 통합
# Claude Code Development Wrapper with Token Management

param(
    [string]$Command = "",
    [string]$Project = "yameyame", 
    [switch]$AutoBackup,
    [switch]$TokenSafe
)

function Invoke-ClaudeWithTokenManagement {
    param($ClaudeCommand, $ProjectPath)
    
    # 1. 작업 전 토큰 사용량 확인
    Write-Host "🔍 토큰 사용량 사전 체크..." -ForegroundColor Yellow
    & "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action check -Project $Project
    
    # 2. Claude Code 실행
    Write-Host "🤖 Claude Code 실행 중..." -ForegroundColor Green
    
    # Claude 명령 실행 (예시)
    try {
        # 여기에 실제 Claude Code 명령어 실행
        Write-Host "실행: claude $ClaudeCommand" -ForegroundColor Cyan
        
        # 실제 사용 시에는 이 부분을 실제 claude 명령으로 대체
        # claude $ClaudeCommand
        
        # 임시 성공 시뮬레이션
        Start-Sleep -Seconds 2
        $success = $true
        
    } catch {
        Write-Host "❌ Claude 실행 중 오류 발생" -ForegroundColor Red
        $success = $false
    }
    
    # 3. 작업 후 자동 백업 (성공 시)
    if ($success -and ($AutoBackup -or $TokenSafe)) {
        Write-Host "💾 작업 완료 후 자동 백업..." -ForegroundColor Green
        & "C:\Users\taejo\.claude\scripts\smart-autorun.ps1" -Action save -Project $Project
    }
}

# 메인 실행 로직
switch ($Command.ToLower()) {
    "autorun" {
        Write-Host "🚀 /autorun with Token Management" -ForegroundColor Cyan
        Invoke-ClaudeWithTokenManagement "/autorun" $Project
    }
    
    "analyze" {
        Write-Host "🔍 Analysis with Auto-backup" -ForegroundColor Cyan  
        Invoke-ClaudeWithTokenManagement "/analyze" $Project
    }
    
    "implement" {
        Write-Host "⚡ Implementation with Token Safety" -ForegroundColor Cyan
        Invoke-ClaudeWithTokenManagement "/implement" $Project
    }
    
    "improve" {
        Write-Host "📈 Improvement with Auto-save" -ForegroundColor Cyan
        Invoke-ClaudeWithTokenManagement "/improve" $Project  
    }
    
    default {
        Write-Host "🤖 Claude Code Token-Safe Development Wrapper" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "📋 사용법:" -ForegroundColor Yellow
        Write-Host "  claude-dev-wrapper.ps1 -Command autorun -AutoBackup" -ForegroundColor White
        Write-Host "  claude-dev-wrapper.ps1 -Command analyze -TokenSafe" -ForegroundColor White  
        Write-Host "  claude-dev-wrapper.ps1 -Command implement -Project yameyame" -ForegroundColor White
        Write-Host ""
        Write-Host "🔧 옵션:" -ForegroundColor Yellow
        Write-Host "  -AutoBackup: 작업 완료 후 자동 백업" -ForegroundColor White
        Write-Host "  -TokenSafe:  토큰 안전 모드 (75% 시 자동 백업)" -ForegroundColor White  
        Write-Host "  -Project:    프로젝트 이름 (기본: yameyame)" -ForegroundColor White
        Write-Host ""
        Write-Host "💡 권장 사용법:" -ForegroundColor Green
        Write-Host "  claude-dev-wrapper.ps1 -Command autorun -TokenSafe -AutoBackup" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "📊 현재 토큰 상태 확인: token-safe-dev check" -ForegroundColor Yellow
Write-Host "💾 즉시 백업: token-safe-dev save" -ForegroundColor Yellow
Write-Host "🏁 세션 종료: token-safe-dev end" -ForegroundColor Yellow