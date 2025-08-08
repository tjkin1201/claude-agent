# Development Workflow Orchestrator

## 전체 워크플로우 구조

### Phase 1: Planning & Research (1-2시간)
```
Sprint Prioritizer → UX Researcher
```
- **Sprint Prioritizer**: 프로젝트 분석 및 우선순위 설정
- **UX Researcher**: 사용자 경험 연구 및 정보구조 설계

### Phase 2: Design & Enhancement (2-3시간)  
```
UX Researcher → UI Designer → Whimsy Injector
```
- **UI Designer**: 시각 디자인 및 컴포넌트 시스템
- **Whimsy Injector**: 마이크로 인터랙션 및 UX 개선

### Phase 3: Development Foundation (1시간)
```
Whimsy Injector → Rapid Prototyper
```
- **Rapid Prototyper**: 기본 구조 및 프로토타입 구축

### Phase 4: Implementation (병렬, 3-5시간)
```
                    ┌─→ Frontend Developer
Rapid Prototyper ─→ │
                    └─→ Backend Developer
```
- **Frontend Developer**: 완전한 UI/UX 구현
- **Backend Developer**: API 및 서버 로직 구현

### Phase 5: Quality Assurance (병렬, 1-2시간)
```
Frontend + Backend ─→ Test Runner → Performance Benchmarker
```
- **Test Runner**: 종합 테스트 및 품질 검증
- **Performance Benchmarker**: 성능 최적화

## 에이전트 체이닝 규칙

### 순차 실행 (Sequential)
- 이전 에이전트 결과물이 필수 입력인 경우
- 의존성이 명확한 작업 흐름

### 병렬 실행 (Parallel) 
- 독립적으로 수행 가능한 작업
- 시간 효율성 극대화

### 협업 실행 (Collaborative)
- 실시간 피드백이 필요한 경우
- 결과물 조율이 필요한 상황## 컨텍스트 관리 체계

### 컨텍스트 저장소
```
C:\Users\taejo\.claude\workflows\contexts\
├── project-context.md      # 프로젝트 기본 정보
├── ux-research.md         # UX 연구 결과
├── design-system.md       # 디자인 시스템 정의
├── technical-spec.md      # 기술 명세서
└── quality-report.md      # 품질 평가 결과
```

### 에이전트 간 정보 전달
1. **입력**: 이전 에이전트의 contexts/ 파일 참조
2. **처리**: 현재 에이전트의 전문 영역 작업
3. **출력**: 다음 에이전트를 위한 contexts/ 파일 업데이트

## 실행 명령어 체계

### 전체 워크플로우 실행
```
/auto-run --project "[프로젝트명]" --type "[앱유형]" --verbose
```

### 단계별 실행
```
/run-agent sprint-prioritizer --project "[프로젝트명]"
/run-agent ux-researcher --input-context "contexts/project-context.md"
```

### 체크포인트 관리
```
/checkpoint save --name "[단계명]"
/checkpoint restore --name "[단계명]"
```

## 품질 관리 체계

### 각 단계별 검증 기준
- **완성도**: 다음 에이전트가 작업 가능한 수준
- **일관성**: 이전 단계 결과물과의 연계성
- **품질**: 각 에이전트별 성공 지표 달성

### 실패 시 대응
- **자동 재시도**: 3회까지 자동 재실행
- **에이전트 교체**: 대체 전략 적용  
- **인간 개입**: 복잡한 문제 시 사용자 확인