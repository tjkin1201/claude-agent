# Claude Code - Universal Project Script
# Usage: claude-anywhere-en [command] [options]

param(
    [Parameter(Position=0)]
    [string]$Command,
    
    [Parameter(Position=1)]
    [string]$Argument,
    
    [Parameter()]
    [string]$ProjectPath = (Get-Location)
)

# Current project path detection
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
    
    Write-ColorText "`n📁 Project Info" "Cyan"
    Write-ColorText "==================" "Cyan"
    Write-ColorText "Path: $currentPath" "White"
    Write-ColorText "Name: $projectName" "White"
    Write-ColorText "Type: $projectType" "White"
    Write-ColorText ""
}

function Invoke-SmartStatus {
    Show-ProjectInfo
    
    Write-ColorText "📊 Git Status:" "Yellow"
    git status --short
    
    Write-ColorText "`n🐛 GitHub Issues:" "Yellow"
    gh issue list --limit 3 2>$null
    
    Write-ColorText "`n🔄 Pull Requests:" "Yellow"
    gh pr list --limit 3 2>$null
    
    $projectType = Get-ProjectType
    
    # Project-specific status check
    switch ($projectType) {
        "nodejs" {
            Write-ColorText "`n📦 NPM Package:" "Yellow"
            if (Test-Path "package.json") {
                $package = Get-Content "package.json" | ConvertFrom-Json
                Write-Host "  Name: $($package.name)"
                Write-Host "  Version: $($package.version)"
            }
        }
        "python" {
            Write-ColorText "`n🐍 Python Environment:" "Yellow"
            python --version 2>$null
        }
        "rust" {
            Write-ColorText "`n🦀 Rust Project:" "Yellow"
            cargo --version 2>$null
        }
    }
}

function Invoke-SmartIssue {
    param($IssueNumber)
    
    if (-not $IssueNumber) {
        Write-ColorText "Usage: claude-anywhere-en issue [issue-number]" "Red"
        return
    }
    
    Show-ProjectInfo
    Write-ColorText "🔄 Implementing Issue #$IssueNumber..." "Yellow"
    
    try {
        $projectType = Get-ProjectType
        
        # Get issue information
        $issueTitle = gh issue view $IssueNumber --json title -q .title
        $issueBody = gh issue view $IssueNumber --json body -q .body
        
        # Project type-specific context prompt
        $contextPrompt = switch ($projectType) {
            "nodejs" { "This is a Node.js/JavaScript project. Please implement according to the framework used in package.json." }
            "python" { "This is a Python project. Please implement according to the libraries in requirements.txt." }
            "rust" { "This is a Rust project. Please use appropriate crates from Cargo.toml." }
            default { "Please analyze the project structure and implement appropriately." }
        }
        
        # Create issue content for Claude
        $issueContent = @"
Project: $projectName ($projectType)
Path: $currentPath

Issue #$IssueNumber: $issueTitle

$issueBody

Implementation Context:
$contextPrompt

Requirements:
1. Implement code according to the issue content
2. Write test cases appropriate for the project type
3. Update documentation if necessary
"@
        
        $issueContent | Out-File -FilePath "temp_issue.txt" -Encoding UTF8
        
        # Implement with Claude (project-specific allowed tools)
        $allowedTools = switch ($projectType) {
            "nodejs" { "Write", "Edit", "Read", "Bash(npm test)", "Bash(npm run build)" }
            "python" { "Write", "Edit", "Read", "Bash(python -m pytest)", "Bash(pip install)" }
            "rust" { "Write", "Edit", "Read", "Bash(cargo test)", "Bash(cargo build)" }
            default { "Write", "Edit", "Read" }
        }
        
        claude --allowedTools $allowedTools < temp_issue.txt
        
        # Cleanup
        Remove-Item "temp_issue.txt" -ErrorAction SilentlyContinue
        
        # Git commit
        git add .
        git commit -m "feat: Implement issue #$IssueNumber - $issueTitle`n`nProject: $projectName`nPath: $currentPath"
        
        Write-ColorText "✅ Complete! To create PR: claude-anywhere-en pr" "Green"
    }
    catch {
        Write-ColorText "❌ Error occurred: $($_.Exception.Message)" "Red"
    }
}

function Invoke-SmartAnalysis {
    Show-ProjectInfo
    Write-ColorText "🔍 Analyzing project..." "Yellow"
    
    $projectType = Get-ProjectType
    
    $analysisPrompt = @"
Please analyze the current project:

Project Information:
- Name: $projectName
- Path: $currentPath
- Type: $projectType

Analysis Request:
1. Identify current implementation status
2. Find incomplete features
3. Suggest next priority tasks
4. Point out areas needing improvement
5. Check test coverage status

Please save the results to PROJECT_ANALYSIS.md file.
"@
    
    try {
        $analysisPrompt | claude --allowedTools "Read", "Write(PROJECT_ANALYSIS.md)" 
        Write-ColorText "✅ Analysis results saved to PROJECT_ANALYSIS.md!" "Green"
    }
    catch {
        Write-ColorText "❌ Analysis failed: $($_.Exception.Message)" "Red"
    }
}

function Show-Help {
    Write-ColorText "`nClaude Code - Universal Project Tool" "Cyan"
    Write-ColorText "====================================" "Cyan"
    Write-ColorText ""
    Write-ColorText "Usage: claude-anywhere-en [command] [options]" "Yellow"
    Write-ColorText ""
    Write-ColorText "Commands:" "Green"
    Write-ColorText "  status              - Show project status (Git + GitHub + Project info)" "White"
    Write-ColorText "  issue [number]      - Implement issue according to project type" "White"
    Write-ColorText "  pr                  - Create pull request from current branch" "White"
    Write-ColorText "  analyze             - Analyze entire project" "White"
    Write-ColorText "  daily-summary       - Generate today's work summary" "White"
    Write-ColorText "  plan-tomorrow       - Generate tomorrow's plan" "White"
    Write-ColorText ""
    Write-ColorText "Examples:" "Green"
    Write-ColorText "  claude-anywhere-en status           # Current project status" "Gray"
    Write-ColorText "  claude-anywhere-en issue 123       # Implement Issue #123" "Gray"
    Write-ColorText "  claude-anywhere-en analyze          # Project analysis" "Gray"
}

function Invoke-DailySummary {
    Show-ProjectInfo
    Write-ColorText "📋 Generating today's work summary..." "Yellow"
    
    $summaryPrompt = @"
Please summarize today's work:

Project: $projectName
Path: $currentPath

Analysis Target:
1. Today's Git commit history
2. Modified files
3. Current work status

Please write in this format:
# 📅 $(Get-Date -Format 'yyyy-MM-dd') Work Summary - $projectName

## ✅ Completed Tasks
## 🔄 In Progress Tasks  
## 📋 Tomorrow's Priorities
## ⚠️ Issues to Resolve

Please save to DAILY_SUMMARY_$(Get-Date -Format 'yyyyMMdd').md
"@
    
    try {
        $fileName = "DAILY_SUMMARY_$(Get-Date -Format 'yyyyMMdd').md"
        $summaryPrompt | claude --allowedTools "Read", "Write($fileName)", "Bash(git log --since='1 day ago')"
        Write-ColorText "✅ Today's work summary saved to $fileName!" "Green"
    }
    catch {
        Write-ColorText "❌ Summary generation failed: $($_.Exception.Message)" "Red"
    }
}

# Main execution logic
switch ($Command.ToLower()) {
    "status" { Invoke-SmartStatus }
    "issue" { Invoke-SmartIssue $Argument }
    "pr" { 
        gh pr create --fill 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-ColorText "✅ PR created successfully!" "Green"
        } else {
            Write-ColorText "❌ PR creation failed. Check if there are changes to commit." "Red"
        }
    }
    "analyze" { Invoke-SmartAnalysis }
    "daily-summary" { Invoke-DailySummary }
    "plan-tomorrow" {
        $planPrompt = @"
Please create tomorrow's work plan:
Project: $projectName

Analyze current status and organize tomorrow's tasks by priority.
Save to TOMORROW_PLAN.md file.
"@
        $planPrompt | claude --allowedTools "Read", "Write(TOMORROW_PLAN.md)"
        Write-ColorText "✅ Tomorrow's plan saved to TOMORROW_PLAN.md!" "Green"
    }
    default { Show-Help }
}