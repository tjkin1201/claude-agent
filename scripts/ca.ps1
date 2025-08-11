# Claude Anywhere - Short Alias
# Usage: ca [command] [options]

param(
    [Parameter(Position=0)]
    [string]$Command,
    
    [Parameter(Position=1)]
    [string]$Argument
)

# Just forward to the main script
& "C:\Users\taejo\.claude\scripts\claude-anywhere-en.ps1" $Command $Argument