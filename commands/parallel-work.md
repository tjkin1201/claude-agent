---
allowed-tools: [Bash, Read, Write, Edit, MultiEdit, Task, TodoWrite]
description: "병렬 작업 및 협업 코딩 도구"
---

# /parallel-work - 병렬 작업 및 협업 코딩

## Purpose
여러 파일이나 작업을 동시에 처리하고 협업 환경에서 효율적으로 코딩할 수 있는 명령어입니다. desktop-commander MCP 서버를 활용합니다.

## Usage
```
/parallel-work [operation] [targets] [--workers n] [--mode sync|async] [--monitor]
```

## Operations
- `edit` - 여러 파일 동시 편집
- `process` - 병렬 처리 작업
- `monitor` - 프로세스 모니터링
- `terminal` - 다중 터미널 세션
- `collaborate` - 협업 세션 시작

## Arguments
- `operation` - 수행할 작업 (edit, process, monitor, terminal, collaborate)
- `targets` - 대상 파일들 또는 작업들
- `--workers n` - 병렬 작업자 수 (기본값: 4)
- `--mode` - 동기/비동기 모드
- `--monitor` - 실시간 모니터링 활성화

## Execution
1. 대상 파일 또는 작업 목록 확인
2. desktop-commander MCP 서버 연결
3. 병렬 처리 환경 설정
4. 지정된 작업을 병렬로 실행
5. 진행 상황 모니터링 및 결과 취합

## MCP Integration
- **Primary Server**: desktop-commander
- **Secondary Server**: filesystem (파일 접근)
- **Tools**: Bash (터미널 작업), Task (병렬 처리), MultiEdit (다중 편집)

## Examples
```bash
# 여러 파일 동시 편집
/parallel-work edit src/*.js --workers 3

# 병렬 프로세스 모니터링
/parallel-work monitor --mode async

# 협업 세션 시작
/parallel-work collaborate project/ --monitor

# 다중 터미널 작업
/parallel-work terminal --workers 2
```

## Features
- 🔄 병렬 파일 처리
- 👥 협업 코딩 지원
- 📊 실시간 진행 상황 모니터링
- 🖥️ 다중 터미널 세션
- ⚡ 성능 최적화된 작업 분산
- 🔧 프로세스 관리 및 제어

## Collaboration Features
- 동시 파일 편집 잠금 방지
- 변경사항 실시간 동기화
- 충돌 감지 및 해결 지원
- 작업 분담 및 할당