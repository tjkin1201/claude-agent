# Claude Code - Universal Project Script (Fixed)
# Usage: claude-anywhere-fixed [command] [options]

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
                try {
                    $package = Get-Content "package.json" | ConvertFrom-Json
                    Write-Host "  Name: $($package.name)"
                    Write-Host "  Version: $($package.version)"
                } catch {
                    Write-Host "  Unable to read package.json"
                }
            }
        }
        "python" {
            Write-ColorText "`n🐍 Python Environment:" "Yellow"
            try {
                python --version 2>$null
            } catch {
                Write-Host "  Python not found"
            }
        }
        "rust" {
            Write-ColorText "`n🦀 Rust Project:" "Yellow"
            try {
                cargo --version 2>$null
            } catch {
                Write-Host "  Cargo not found"
            }
        }
    }
}

function Invoke-SmartIssue {
    param($IssueNumber)
    
    if (-not $IssueNumber) {
        Write-ColorText "Usage: claude-anywhere-fixed issue [issue-number]" "Red"
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

Issue Number: $IssueNumber
Issue Title: $issueTitle

Issue Description:
$issueBody

Implementation Context:
$contextPrompt

Requirements:
1. Implement code according to the issue content
2. Write test cases appropriate for the project type
3. Update documentation if necessary
"@
        
        $issueContent | Out-File -FilePath "temp_issue.txt" -Encoding UTF8
        
        # Implement with Claude using Get-Content
        Write-ColorText "Calling Claude to implement the issue..." "Yellow"
        $issueText = Get-Content "temp_issue.txt" -Raw
        $claudeResult = $issueText | claude --allowedTools "Write" "Edit" "Read"
        
        Write-ColorText $claudeResult "Green"
        
        # Cleanup
        Remove-Item "temp_issue.txt" -ErrorAction SilentlyContinue
        
        # Git commit
        git add .
        $commitMessage = "feat: Implement issue #$IssueNumber - $issueTitle"
        git commit -m "$commitMessage`n`nProject: $projectName`nPath: $currentPath"
        
        Write-ColorText "✅ Complete! To create PR: claude-anywhere-fixed pr" "Green"
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
        Write-ColorText "Calling Claude for project analysis..." "Yellow"
        $analysisResult = $analysisPrompt | claude --allowedTools "Read" "Write"
        Write-ColorText $analysisResult "Green"
        Write-ColorText "✅ Analysis completed!" "Green"
    }
    catch {
        Write-ColorText "❌ Analysis failed: $($_.Exception.Message)" "Red"
    }
}

function Show-Help {
    Write-ColorText "`nClaude Code - Universal Project Tool" "Cyan"
    Write-ColorText "====================================" "Cyan"
    Write-ColorText ""
    Write-ColorText "Usage: claude-anywhere-fixed [command] [options]" "Yellow"
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
    Write-ColorText "  claude-anywhere-fixed status           # Current project status" "Gray"
    Write-ColorText "  claude-anywhere-fixed issue 123       # Implement Issue #123" "Gray"
    Write-ColorText "  claude-anywhere-fixed analyze          # Project analysis" "Gray"
}

function Invoke-DailySummary {
    Show-ProjectInfo
    Write-ColorText "📋 Generating today's work summary..." "Yellow"
    
    $todayDate = Get-Date -Format 'yyyy-MM-dd'
    $fileName = "DAILY_SUMMARY_$(Get-Date -Format 'yyyyMMdd').md"
    
    $summaryPrompt = @"
Please summarize today's work:

Project: $projectName
Path: $currentPath
Date: $todayDate

Analysis Target:
1. Today's Git commit history
2. Modified files
3. Current work status

Please write in this format:
# Work Summary - $todayDate - $projectName

## Completed Tasks
## In Progress Tasks  
## Tomorrow's Priorities
## Issues to Resolve

Please save to $fileName
"@
    
    try {
        Write-ColorText "Generating daily summary..." "Yellow"
        $summaryResult = $summaryPrompt | claude --allowedTools "Read" "Write" "Bash"
        Write-ColorText $summaryResult "Green"
        Write-ColorText "✅ Today's work summary completed!" "Green"
    }
    catch {
        Write-ColorText "❌ Summary generation failed: $($_.Exception.Message)" "Red"
    }
}

function Invoke-CreatePR {
    Write-ColorText "🔄 Creating Pull Request..." "Yellow"
    
    try {
        gh pr create --fill
        if ($LASTEXITCODE -eq 0) {
            Write-ColorText "✅ PR created successfully!" "Green"
        } else {
            Write-ColorText "❌ PR creation failed. Check if there are changes to commit." "Red"
        }
    } catch {
        Write-ColorText "❌ Error creating PR: $($_.Exception.Message)" "Red"
    }
}

function Invoke-PlanTomorrow {
    $planPrompt = @"
Please create tomorrow's work plan:
Project: $projectName
Path: $currentPath

Analyze current status and organize tomorrow's tasks by priority.
Save to TOMORROW_PLAN.md file.
"@
    
    try {
        Write-ColorText "Creating tomorrow's plan..." "Yellow"
        $planResult = $planPrompt | claude --allowedTools "Read" "Write"
        Write-ColorText $planResult "Green"
        Write-ColorText "✅ Tomorrow's plan completed!" "Green"
    } catch {
        Write-ColorText "❌ Plan creation failed: $($_.Exception.Message)" "Red"
    }
}

# Main execution logic
switch ($Command.ToLower()) {
    "status" { Invoke-SmartStatus }
    "issue" { Invoke-SmartIssue $Argument }
    "pr" { Invoke-CreatePR }
    "analyze" { Invoke-SmartAnalysis }
    "daily-summary" { Invoke-DailySummary }
    "plan-tomorrow" { Invoke-PlanTomorrow }
    default { Show-Help }
}