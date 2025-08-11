---
allowed-tools: [Read, Grep, Glob, Bash, TodoWrite]
description: "코드 품질, 보안, 성능 및 아키텍처 분석"
---

# /analyze - Code Analysis

## Purpose
Execute comprehensive code analysis across quality, security, performance, and architecture domains.

## Usage
```
/analyze [target] [--focus quality|security|performance|architecture] [--depth quick|deep]
```

## Arguments
- `target` - Files, directories, or project to analyze
- `--focus` - Analysis focus area (quality, security, performance, architecture)
- `--depth` - Analysis depth (quick, deep)
- `--format` - Output format (text, json, report)

## Execution
1. Discover and categorize files for analysis
2. Apply appropriate analysis tools and techniques
3. Generate findings with severity ratings
4. Create actionable recommendations with priorities
5. Present comprehensive analysis report

## Claude Code Integration
- Uses Glob for systematic file discovery
- Leverages Grep for pattern-based analysis
- Applies Read for deep code inspection
- Maintains structured analysis reporting