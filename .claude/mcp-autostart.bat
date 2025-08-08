@echo off
echo Starting Claude Code with all MCP servers...

REM Check MCP server health
claude mcp list

REM Display MCP server status
echo.
echo =================================
echo  Claude Code MCP Environment
echo =================================
echo Total MCP Servers: 7
echo - memory-claude      (Knowledge Graph)
echo - sequential-thinking (Complex Analysis)
echo - filesystem         (File Operations)
echo - text-editor        (Text Editing)
echo - image-extractor    (Image Processing)
echo - playwright         (Browser Automation)
echo - parallel-work      (Desktop Commander)
echo =================================
echo.
echo All MCP servers are ready!
echo You can now use SuperClaude framework with:
echo   --seq (sequential-thinking)
echo   --play (playwright)
echo   --parallel (parallel-work)
echo   File operations (filesystem)
echo.
echo NEW: YouTube-style slash commands available:
echo   /img-extract [image] --detailed
echo   /parallel-work edit [files] --workers 4
echo.
pause