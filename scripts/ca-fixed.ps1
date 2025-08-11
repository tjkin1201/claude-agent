# Claude Anywhere - Short Alias (Fixed)
# Usage: ca-fixed [command] [options]

param(
    [Parameter(Position=0)]
    [string]$Command,
    
    [Parameter(Position=1)]
    [string]$Argument
)

# Forward to the fixed main script
& "C:\Users\taejo\.claude\scripts\claude-anywhere-fixed.ps1" $Command $Argument