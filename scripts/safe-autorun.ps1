# Safe AutoRun - Simple Token Management
param(
    [string]$Action = "run",
    [switch]$Backup
)

Write-Host "Claude Code Token-Safe AutoRun System" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

$projectPath = "C:\Users\taejo\yameyame"

if (Test-Path $projectPath) {
    Set-Location $projectPath
    Write-Host "Project: $projectPath" -ForegroundColor Green
} else {
    Write-Host "Project path not found: $projectPath" -ForegroundColor Red
    exit 1
}

# Simple token estimation
function Get-TokenEstimate {
    try {
        $files = Get-ChildItem -Recurse -File | Where-Object {
            $_.Extension -match '\.(md|js|ts|json)$' -and
            $_.FullName -notmatch 'node_modules'
        }
        
        $fileCount = $files.Count
        $estimatedTokens = $fileCount * 40 + 1000
        $percentage = [math]::Min(100, ($estimatedTokens / 8000) * 100)
        
        return @{
            Tokens = $estimatedTokens
            Percentage = $percentage
            Files = $fileCount
        }
    } catch {
        return @{
            Tokens = 2000
            Percentage = 25
            Files = 50
        }
    }
}

# Get current token estimate
$tokenInfo = Get-TokenEstimate

Write-Host ""
Write-Host "Token Usage Estimate:" -ForegroundColor Yellow
Write-Host "- Files: $($tokenInfo.Files)" -ForegroundColor White
Write-Host "- Estimated Tokens: $($tokenInfo.Tokens)" -ForegroundColor White
Write-Host "- Usage: $([math]::Round($tokenInfo.Percentage, 1))%" -ForegroundColor White

# Check if backup is needed
if ($tokenInfo.Percentage -ge 75 -or $Backup) {
    Write-Host ""
    Write-Host "WARNING: High token usage detected!" -ForegroundColor Red
    Write-Host "Performing automatic backup..." -ForegroundColor Yellow
    
    # Simple backup
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
    
    # Create simple snapshot
    $snapshot = @"
# Development Snapshot - $timestamp

Backup Reason: High token usage ($([math]::Round($tokenInfo.Percentage, 1))%)
Timestamp: $(Get-Date)
Files: $($tokenInfo.Files)
Estimated Tokens: $($tokenInfo.Tokens)

Continue development in next session.
"@
    
    $snapshot | Out-File -FilePath "snapshot_$timestamp.md" -Encoding UTF8
    
    # Git operations
    git add . 2>$null
    git commit -m "save: Auto backup at $([math]::Round($tokenInfo.Percentage, 1))% token usage" 2>$null
    git push origin main 2>$null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "SUCCESS: Backup completed!" -ForegroundColor Green
        Write-Host "Repository: https://github.com/tjkin1201/yameyame-app" -ForegroundColor Cyan
    } else {
        Write-Host "WARNING: Backup may have failed" -ForegroundColor Yellow
    }
    
} else {
    Write-Host ""
    Write-Host "Token usage is OK. Continue working..." -ForegroundColor Green
}

Write-Host ""
Write-Host "Commands:" -ForegroundColor Yellow
Write-Host "- Check: safe-autorun.ps1" -ForegroundColor White
Write-Host "- Force Backup: safe-autorun.ps1 -Backup" -ForegroundColor White

Write-Host ""
Write-Host "Ready for /autorun or other Claude commands!" -ForegroundColor Green