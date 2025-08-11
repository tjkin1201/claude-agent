# Claude Code 폴더 구조 관리 가이드

## 📂 현재 .claude 폴더 구조

```
C:\Users\taejo\.claude\
├── 🎯 Core System (핵심 시스템)
│   ├── CLAUDE.md              # 메인 진입점
│   ├── COMMANDS.md            # 18개 명령어 시스템
│   ├── FLAGS.md               # 최적화 플래그
│   ├── PRINCIPLES.md          # 개발 원칙
│   ├── RULES.md               # 실행 규칙
│   ├── MCP.md                 # MCP 서버 통합
│   ├── PERSONAS.md            # 11개 전문가 페르소나
│   ├── ORCHESTRATOR.md        # 지능형 라우팅
│   └── MODES.md               # 3가지 운영 모드

├── 🚀 Workflows (전문 워크플로우)
│   └── workflows/
│       ├── README.md          # 18개 전문분야 인덱스
│       ├── expanded-professional-workflows.md
│       └── categories/        # 전문분야별 워크플로우
│           ├── mental-wellness.md
│           ├── pet-services.md
│           ├── lifestyle-services.md
│           ├── beauty-wellness.md
│           └── ... (14개 더)

├── ⚙️ Configuration (설정)
│   ├── settings.json          # Claude Code 기본 설정
│   ├── settings.local.json    # 로컬 환경 설정
│   ├── mcp_servers.json       # MCP 서버 설정
│   ├── claude-code-mcp-config.md
│   └── mcp-autostart.bat      # MCP 자동 시작

├── 🤖 Agents (전문 에이전트들)
│   └── agents/                # 커스텀 에이전트 저장소

├── 📜 Commands (명령어 확장)
│   └── commands/              # 커스텀 명령어

├── 🔧 Tools & Extensions
│   ├── hooks/                 # Git 훅 및 자동화
│   ├── ide/                   # IDE 통합 설정
│   └── shell-snapshots/       # 쉘 상태 스냅샷

├── 📊 Monitoring & Logs
│   ├── logs/                  # 실행 로그
│   ├── todos/                 # 작업 관리
│   ├── statsig/               # 성능 통계
│   └── mcp-status.md          # MCP 서버 상태

├── 💾 Data Management
│   ├── backups/               # 설정 백업
│   ├── local/                 # 로컬 데이터
│   └── projects/              # 프로젝트별 설정

└── 🔧 Configuration Files
    └── config/                # 추가 설정 파일들
```

## 🎯 폴더별 용도 및 관리 규칙

### 📋 Core System (핵심 시스템)
**용도**: SuperClaude 프레임워크 핵심 파일들
**관리**: 직접 편집, 백업 필수
**규칙**: 절대 삭제 금지, 수정시 백업 선행

### 🚀 Workflows (워크플로우)
**용도**: 18개 전문분야 워크플로우 템플릿
**관리**: categories/ 내 분야별 관리
**규칙**: 새 분야 추가시 README.md 동시 업데이트

### ⚙️ Configuration (설정)
**용도**: Claude Code 실행 환경 설정
**관리**: 자동 생성, 필요시 수동 편집
**규칙**: settings.json 건드리지 말고 settings.local.json 사용

### 🤖 Agents & 📜 Commands
**용도**: 커스텀 확장 기능
**관리**: 필요시 추가, 정기 정리
**규칙**: 표준 에이전트/명령어와 충돌 방지

### 📊 Monitoring & 💾 Data
**용도**: 실행 데이터 및 백업
**관리**: 자동 생성, 정기 정리
**규칙**: 용량 관리, 오래된 파일 자동 삭제

## 📋 관련 도구들 (선택적 이동)

### 🤖 Claude 관련 도구들
```yaml
선택적_이동_대상:
  C:\Users\taejo\claude-squad\:
    - 목적: "Claude Code 다중 세션 관리 도구"
    - 기능: "여러 Claude 작업을 병렬 처리"
    - 이동여부: "선택적 - 독립적 도구"
    
  C:\Users\taejo\claude-task\:
    - 목적: "AI 기반 작업 관리 시스템"  
    - 기능: "복잡한 프로젝트를 작업 단위로 분해"
    - 이동여부: "선택적 - 독립적 도구"
```

### 🔍 이동 필요성 분석
```yaml
완전히_독립적인_도구들:
  - claude-squad: GitHub 프로젝트, 별도 설치/설정
  - claude-task: NPM 패키지, 별도 MCP 서버
  
SuperClaude_설정과_독립적:
  - 자체적인 설정 파일 보유
  - Claude Code 기본 기능 확장 도구
  - .claude 폴더와 직접적 연관성 없음
```

### 💡 권장사항
```yaml
이식_전략:
  최소_이식: ".claude 폴더만" (100% SuperClaude 환경)
  확장_이식: ".claude + claude-squad + claude-task" (완전 환경)
  
권장_접근법:
  1단계: .claude 폴더만 복사해서 테스트
  2단계: 필요시 개별 도구들 추가 설치
  3단계: 통합 환경 구축
```

## 🔒 파일 생성 규칙

### ✅ 허용되는 생성
```yaml
허용_위치:
  - C:\Users\taejo\.claude\workflows\categories\     # 새 워크플로우
  - C:\Users\taejo\.claude\agents\                   # 커스텀 에이전트
  - C:\Users\taejo\.claude\commands\                 # 커스텀 명령어
  - C:\Users\taejo\.claude\config\                   # 추가 설정
  - C:\Users\taejo\.claude\projects\                 # 프로젝트별 설정
```

### ❌ 금지되는 생성
```yaml
금지_위치:
  - 데스크탑, 문서 폴더 등 개인 폴더
  - 프로젝트 루트에 claude 관련 파일 직접 생성
  - 시스템 폴더나 임시 폴더
  - 기존 핵심 파일 덮어쓰기
```

## 🛠️ 정리 및 유지보수

### 📅 정기 정리 (월 1회)
```bash
# 로그 파일 정리 (30일 이상된 파일)
# 백업 파일 정리 (6개월 이상된 파일)  
# 임시 파일 정리
# 사용하지 않는 커스텀 에이전트/명령어 정리
```

### 🔍 구조 검증
```bash
# 필수 파일 존재 여부 확인
# 설정 파일 문법 검증
# 워크플로우 인덱스 일관성 확인
# MCP 서버 연결 상태 확인
```

### 💾 백업 전략
```yaml
백업_주기:
  일간: settings.json, mcp_servers.json
  주간: 전체 workflows/ 폴더
  월간: 전체 .claude/ 폴더
  
백업_위치: 
  - C:\Users\taejo\.claude\backups\
  - 외부 클라우드 스토리지 (선택적)
```

## 🎯 Best Practices

### 1. 체계적 관리
- 새 기능 추가시 해당 폴더에만 파일 생성
- 관련 문서는 같은 폴더에 함께 관리
- 네이밍 컨벤션 일관성 유지

### 2. 버전 관리
- 중요 설정 변경시 백업 선행
- 변경 사항은 주석으로 기록
- 실험적 설정은 별도 파일로 관리

### 3. 성능 최적화
- 불필요한 파일 정기 정리
- 로그 파일 크기 모니터링
- MCP 서버 설정 최적화

### 4. 보안
- 민감한 정보는 환경 변수 사용
- 설정 파일 권한 관리
- 정기적 보안 점검

이 구조를 따라 관리하면 Claude 설정이 체계적이고 유지보수하기 쉬워집니다! 🚀