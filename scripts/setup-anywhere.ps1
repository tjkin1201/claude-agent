# Claude Anywhere Setup Script
# PowerShell execution policy: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

function Write-ColorText {
    param($Text, $Color = "White")
    Write-Host $Text -ForegroundColor $Color
}

Write-ColorText ""
Write-ColorText "======================================" "Cyan"
Write-ColorText "   Claude Anywhere Auto Setup" "Cyan"
Write-ColorText "======================================" "Cyan"
Write-ColorText ""

# 1. PATH Setup
Write-ColorText "1. Setting up PATH..." "Yellow"
try {
    $currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
    $claudeScriptsPath = "C:\Users\taejo\.claude\scripts"
    
    if ($currentPath -notlike "*$claudeScriptsPath*") {
        $newPath = $currentPath + ";" + $claudeScriptsPath
        [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
        Write-ColorText "✅ PATH setup completed" "Green"
    } else {
        Write-ColorText "✅ PATH already configured" "Green"
    }
} catch {
    Write-ColorText "❌ PATH setup failed: $($_.Exception.Message)" "Red"
}

# 2. PowerShell Execution Policy
Write-ColorText ""
Write-ColorText "2. Setting PowerShell execution policy..." "Yellow"
try {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Write-ColorText "✅ PowerShell policy configured" "Green"
} catch {
    Write-ColorText "❌ PowerShell policy setup failed: $($_.Exception.Message)" "Red"
}

# 3. GitHub CLI Status Check
Write-ColorText ""
Write-ColorText "3. Checking GitHub CLI status..." "Yellow"
try {
    $null = gh auth status 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-ColorText "✅ GitHub CLI authenticated" "Green"
    } else {
        Write-ColorText "⚠️  GitHub CLI authentication needed" "Yellow"
        Write-ColorText "   Run 'gh auth login' later" "Gray"
    }
} catch {
    Write-ColorText "⚠️  GitHub CLI not installed or not authenticated" "Yellow"
    Write-ColorText "   Install GitHub CLI and run 'gh auth login'" "Gray"
}

# 4. Test Files
Write-ColorText ""
Write-ColorText "4. Verifying script files..." "Yellow"
$scriptFiles = @(
    "claude-anywhere.ps1",
    "quick-start.ps1", 
    "github-quick.cmd"
)

foreach ($file in $scriptFiles) {
    $filePath = "C:\Users\taejo\.claude\scripts\$file"
    if (Test-Path $filePath) {
        Write-ColorText "✅ $file found" "Green"
    } else {
        Write-ColorText "❌ $file missing" "Red"
    }
}

Write-ColorText ""
Write-ColorText "======================================" "Cyan"
Write-ColorText "   Setup Complete! 🎉" "Cyan"
Write-ColorText "======================================" "Cyan"
Write-ColorText ""
Write-ColorText "Usage (open NEW command prompt):" "Green"
Write-ColorText "  claude-anywhere status      # Project status" "White"
Write-ColorText "  claude-anywhere issue 123   # Implement issue" "White"
Write-ColorText "  claude-anywhere analyze     # Project analysis" "White"
Write-ColorText ""
Write-ColorText "⚠️  IMPORTANT: Open a NEW command prompt to use the commands!" "Yellow"
Write-ColorText ""

# Create a simple test
Write-ColorText "Quick test (optional):" "Green"
Write-ColorText "  cd [your-project-folder]" "Gray"
Write-ColorText "  claude-anywhere status" "Gray"
Write-ColorText ""

Read-Host "Press Enter to continue"