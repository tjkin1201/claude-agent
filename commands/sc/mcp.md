---
allowed-tools: [Bash, Read, Write, Edit]
description: "MCP server management and diagnostics"
---

# /mcp - MCP Server Management

## Purpose
Manage, diagnose, and configure MCP servers for Claude Code integration.

## Usage
```
/mcp [command] [--server name] [--debug] [--fix]
```

## Commands
- `list` - Show all MCP server status and health
- `add <name> <command> [args...]` - Add new MCP server
- `remove <name>` - Remove MCP server
- `test <name>` - Test specific MCP server connection
- `fix` - Automatically fix common MCP connection issues
- `status` - Detailed health check with diagnostics

## Arguments
- `--server name` - Target specific MCP server
- `--debug` - Enable debug mode for detailed error information
- `--fix` - Automatically attempt to fix detected issues
- `--windows` - Use Windows-compatible command format

## Execution
1. Execute specified MCP management command
2. Provide detailed status and diagnostic information
3. Automatically detect and suggest fixes for common issues
4. Support Windows-specific MCP server configuration

## Claude Code Integration
- Direct integration with `claude mcp` commands
- Automatic Windows compatibility fixes
- Debug mode for connection troubleshooting
- Configuration validation and repair

## Common Fixes
- Convert Unix paths to Windows format
- Fix bash path issues in Windows
- Correct MCP server command syntax
- Validate npm package availability