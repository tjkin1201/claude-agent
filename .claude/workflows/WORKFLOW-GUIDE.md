# Claude Code Sub-Agent 워크플로우 실행 가이드

## 빠른 시작

### 1. 새 프로젝트 시작
```
/auto-run --project "프로젝트명" --type "앱유형" --verbose
```

### 2. 개별 에이전트 실행
```
/spawn agent --name "sprint-prioritizer" --context "프로젝트 요구사항..."
```

### 3. 워크플로우 상태 확인
```
/workflow status --show-progress
```

## 상세 실행 방법

### Phase 1: 기획 및 연구
1. **Sprint Prioritizer 실행**
   ```
   /spawn agent --name "sprint-prioritizer" 
   프로젝트: [프로젝트명]
   목표: [비즈니스 목표]
   일정: [예상 일정]
   ```

2. **UX Researcher 실행**
   ```
   /spawn agent --name "ux-researcher" --input-context "contexts/project-context.md"
   ```

### Phase 2: 디자인 및 개선
1. **UI Designer 실행**
   ```
   /spawn agent --name "ui-designer" --input-context "contexts/ux-research.md"
   ```

2. **Whimsy Injector 실행**
   ```
   /spawn agent --name "whimsy-injector" --input-context "contexts/design-system.md"
   ```

### Phase 3-5: 개발 및 품질보증
```
/spawn agent --name "rapid-prototyper" --input-context "contexts/design-system.md"
/spawn agent --name "frontend-developer" --parallel
/spawn agent --name "backend-developer" --parallel  
/spawn agent --name "test-runner" --wait-for "frontend,backend"
/spawn agent --name "performance-benchmarker" --wait-for "test-runner"
```

## 컨텍스트 관리

### 컨텍스트 파일 생성 자동화
각 에이전트는 작업 완료 시 자동으로 다음 에이전트를 위한 컨텍스트 파일을 생성합니다.

### 수동 컨텍스트 업데이트
```
/update-context --file "contexts/project-context.md" --append "추가 요구사항..."
```## 문제 해결

### 에이전트 실행 실패 시
1. 컨텍스트 파일 확인
2. 이전 단계 완료 상태 검증
3. 에이전트 재시작: `/restart-agent --name "에이전트명"`

### 품질 기준 미달 시
1. 성공 기준 재검토
2. 에이전트 피드백 제공
3. 필요시 이전 체크포인트로 복원

### 병렬 실행 동기화 문제
1. 의존성 체크: `/check-dependencies`
2. 대기 상태 설정: `--wait-for "agent1,agent2"`
3. 수동 동기화: `/sync-agents`

## 고급 활용

### 커스텀 에이전트 추가
1. `workflows/agents/` 폴더에 새 에이전트 파일 생성
2. 기존 에이전트 템플릿 참조
3. 오케스트레이터에 등록

### 워크플로우 커스터마이징
1. `orchestrator.md` 수정
2. 단계별 순서 변경
3. 병렬/순차 실행 조합 최적화

## 베스트 프랙티스

### 효율적 실행을 위한 팁
- 프로젝트 요구사항 명확히 정의
- 각 단계별 성공 기준 확인
- 정기적인 체크포인트 저장
- 컨텍스트 파일 품질 관리

### 비용 최적화
- 불필요한 에이전트 실행 방지
- 컨텍스트 크기 관리
- 병렬 실행 최적화
- 체크포인트 활용한 부분 재실행