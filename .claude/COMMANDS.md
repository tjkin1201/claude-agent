# COMMANDS.md - SuperClaude Command Execution Framework

Command execution framework for Claude Code SuperClaude integration.

## Command System Architecture

### Core Command Structure
```yaml
---
command: "/{command-name}"
category: "Primary classification"
purpose: "Operational objective"
wave-enabled: true|false
performance-profile: "optimization|standard|complex"
---
```

### Command Processing Pipeline
1. **Input Parsing**: `$ARGUMENTS` with `@<path>`, `!<command>`, `--<flags>`
2. **Context Resolution**: Auto-persona activation and MCP server selection
3. **Wave Eligibility**: Complexity assessment and wave mode determination
4. **Execution Strategy**: Tool orchestration and resource allocation
5. **Quality Gates**: Validation checkpoints and error handling

### Integration Layers
- **Claude Code**: Native slash command compatibility
- **Persona System**: Auto-activation based on command context
- **MCP Servers**: Context7, Sequential, Magic, Playwright integration
- **Wave System**: Multi-stage orchestration for complex operations

## Wave System Integration

**Wave Orchestration Engine**: Multi-stage command execution with compound intelligence. Auto-activates on complexity ≥0.7 + files >20 + operation_types >2.

**Wave-Enabled Commands**:
- **Tier 1**: `/analyze`, `/build`, `/implement`, `/improve`
- **Tier 2**: `/design`, `/task`

### Development Commands

**`/build | /빌드 $ARGUMENTS`**
```yaml
---
command: "/build | /빌드"
category: "Development & Deployment | 개발 및 배포"
purpose: "Project builder with framework detection | 프레임워크 자동감지 프로젝트 빌더"
wave-enabled: true
performance-profile: "optimization"
---
```
- **Auto-Persona**: Frontend, Backend, Architect, Scribe
- **MCP Integration**: Magic (UI builds), Context7 (patterns), Sequential (logic)
- **Tool Orchestration**: [Read, Grep, Glob, Bash, TodoWrite, Edit, MultiEdit]
- **Arguments**: `[target]`, `@<path>`, `!<command>`, `--<flags>`
- **한글 사용법**: `/빌드 프로젝트명 --최적화 --병렬처리`

**`/implement | /구현 $ARGUMENTS`**
```yaml
---
command: "/implement | /구현"
category: "Development & Implementation | 개발 및 구현"
purpose: "Feature and code implementation with intelligent persona activation | 지능형 페르소나 기반 기능 및 코드 구현"
wave-enabled: true
performance-profile: "standard"
---
```
- **Auto-Persona**: Frontend, Backend, Architect, Security (context-dependent)
- **MCP Integration**: Magic (UI components), Context7 (patterns), Sequential (complex logic)
- **Tool Orchestration**: [Read, Write, Edit, MultiEdit, Bash, Glob, TodoWrite, Task]
- **Arguments**: `[feature-description]`, `--type component|api|service|feature`, `--framework <name>`, `--<flags>`
- **한글 사용법**: `/구현 로그인기능 --타입 컴포넌트 --프레임워크 React`


### Analysis Commands

**`/analyze | /분석 $ARGUMENTS`**
```yaml
---
command: "/analyze | /분석"
category: "Analysis & Investigation | 분석 및 조사"
purpose: "Multi-dimensional code and system analysis | 다차원 코드 및 시스템 분석"
wave-enabled: true
performance-profile: "complex"
---
```
- **Auto-Persona**: Analyzer, Architect, Security
- **MCP Integration**: Sequential (primary), Context7 (patterns), Magic (UI analysis)
- **Tool Orchestration**: [Read, Grep, Glob, Bash, TodoWrite]
- **Arguments**: `[target]`, `@<path>`, `!<command>`, `--<flags>`
- **한글 사용법**: `/분석 프로젝트 --심층분석 --보안검사`

**`/troubleshoot | /문제해결 [symptoms] [flags]`** - 문제 조사 및 해결 | Auto-Persona: Analyzer, QA | MCP: Sequential, Playwright

**`/explain | /설명 [topic] [flags]`** - 교육용 설명 및 개념 해설 | Auto-Persona: Mentor, Scribe | MCP: Context7, Sequential


### Quality Commands

**`/improve | /개선 [target] [flags]`**
```yaml
---
command: "/improve | /개선"
category: "Quality & Enhancement | 품질 및 개선"
purpose: "Evidence-based code enhancement | 증거 기반 코드 개선"
wave-enabled: true
performance-profile: "optimization"
---
```
- **Auto-Persona**: Refactorer, Performance, Architect, QA
- **MCP Integration**: Sequential (logic), Context7 (patterns), Magic (UI improvements)
- **Tool Orchestration**: [Read, Grep, Glob, Edit, MultiEdit, Bash]
- **Arguments**: `[target]`, `@<path>`, `!<command>`, `--<flags>`
- **한글 사용법**: `/개선 코드베이스 --성능최적화 --리팩토링`


**`/cleanup | /정리 [target] [flags]`** - 프로젝트 정리 및 기술부채 감소 | Auto-Persona: Refactorer | MCP: Sequential

### Additional Commands

**`/document | /문서화 [target] [flags]`** - 문서 생성 및 작성 | Auto-Persona: Scribe, Mentor | MCP: Context7, Sequential

**`/estimate | /예측 [target] [flags]`** - 증거 기반 예측 및 추정 | Auto-Persona: Analyzer, Architect | MCP: Sequential, Context7

**`/task | /작업 [operation] [flags]`** - 장기 프로젝트 관리 | Auto-Persona: Architect, Analyzer | MCP: Sequential

**`/test | /테스트 [type] [flags]`** - 테스트 워크플로 및 품질 검증 | Auto-Persona: QA | MCP: Playwright, Sequential

**`/git | /깃 [operation] [flags]`** - Git 워크플로 도우미 | Auto-Persona: DevOps, Scribe, QA | MCP: Sequential

**`/design | /설계 [domain] [flags]`** - 설계 오케스트레이션 | Auto-Persona: Architect, Frontend | MCP: Magic, Sequential, Context7

### Meta & Orchestration Commands

**`/index | /색인 [query] [flags]`** - 명령어 카탈로그 검색 | Auto-Persona: Mentor, Analyzer | MCP: Sequential

**`/load | /로드 [path] [flags]`** - 프로젝트 컨텍스트 로딩 | Auto-Persona: Analyzer, Architect, Scribe | MCP: All servers

**Iterative Operations | 반복 작업** - 반복 개선을 위해 `--loop | --반복` 플래그 사용

**`/spawn | /생성 [mode] [flags]`** - 작업 오케스트레이션 | Auto-Persona: Analyzer, Architect, DevOps | MCP: All servers

## Command Execution Matrix

### Performance Profiles
```yaml
optimization: "캐싱과 병렬 실행을 통한 고성능 처리"
standard: "적당한 리소스 사용량으로 균형잡힌 성능"
complex: "포괄적 분석을 위한 리소스 집약적 처리"
```

### Command Categories | 명령어 카테고리
- **Development | 개발**: build/빌드, implement/구현, design/설계
- **Planning | 계획**: workflow/워크플로, estimate/예측, task/작업
- **Analysis | 분석**: analyze/분석, troubleshoot/문제해결, explain/설명
- **Quality | 품질**: improve/개선, cleanup/정리
- **Testing | 테스트**: test/테스트
- **Documentation | 문서화**: document/문서화
- **Version-Control | 버전관리**: git/깃
- **Meta | 메타**: index/색인, load/로드, spawn/생성

### Wave-Enabled Commands | 웨이브 지원 명령어
7 commands: `/analyze | /분석`, `/build | /빌드`, `/design | /설계`, `/implement | /구현`, `/improve | /개선`, `/task | /작업`, `/workflow | /워크플로`

