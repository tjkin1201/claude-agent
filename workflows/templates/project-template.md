# 프로젝트 템플릿

## 프로젝트 기본 정보
```yaml
프로젝트명: ""
프로젝트 유형: ""  # 웹앱/모바일앱/데스크톱앱/API
목표 사용자: ""
주요 기능: []
기술 스택:
  프론트엔드: ""
  백엔드: ""
  데이터베이스: ""
  배포환경: ""
예상 일정: ""
팀 구성: ""
```

## 워크플로우 실행 체크리스트

### Phase 1: Planning & Research ✅
- [ ] **Sprint Prioritizer**: 우선순위 매트릭스 완성
- [ ] **UX Researcher**: 사용자 여정 및 IA 완성
- [ ] 컨텍스트 파일 생성: `contexts/project-context.md`, `contexts/ux-research.md`

### Phase 2: Design & Enhancement ✅  
- [ ] **UI Designer**: 디자인 시스템 및 목업 완성
- [ ] **Whimsy Injector**: 마이크로 인터랙션 정의 완성
- [ ] 컨텍스트 파일 업데이트: `contexts/design-system.md`

### Phase 3: Development Foundation ✅
- [ ] **Rapid Prototyper**: 기본 구조 및 프로토타입 완성
- [ ] 컨텍스트 파일 업데이트: `contexts/technical-spec.md`

### Phase 4: Implementation (병렬) ✅
- [ ] **Frontend Developer**: UI/UX 완전 구현 
- [ ] **Backend Developer**: API 및 서버 완전 구현
- [ ] 프론트엔드-백엔드 연동 테스트 완료

### Phase 5: Quality Assurance (병렬) ✅
- [ ] **Test Runner**: 모든 테스트 통과
- [ ] **Performance Benchmarker**: 성능 기준 달성
- [ ] 컨텍스트 파일 완성: `contexts/quality-report.md`## 각 단계별 성공 기준

### Sprint Prioritizer 성공 기준
- 기능 우선순위 매트릭스 완성 (가치 vs 복잡도)
- MVP 범위 명확히 정의
- 3개월 로드맵 작성 (2주 스프린트 기준)

### UX Researcher 성공 기준  
- 사용자 페르소나 3-5개 정의
- 핵심 사용자 여정 완성
- 정보 아키텍처 및 네비게이션 구조 확정

### UI Designer 성공 기준
- 완전한 디자인 시스템 (색상, 폰트, 컴포넌트)
- 모든 화면 고해상도 목업 완성
- 개발자가 구현 가능한 수준의 상세 가이드

### Whimsy Injector 성공 기준
- 핵심 기능별 마이크로 인터랙션 정의
- 브랜드 개성을 드러내는 디테일 완성
- 사용자 참여도 향상 요소 추가

### Rapid Prototyper 성공 기준
- 4시간 이내 동작하는 프로토타입 완성
- 핵심 기능 동작 확인
- 개발 환경 설정 완료

### Frontend Developer 성공 기준
- 디자인 100% 구현
- 모든 마이크로 인터랙션 동작
- Lighthouse 점수 90 이상

### Backend Developer 성공 기준
- API 응답시간 200ms 이하
- 보안 취약점 0개
- 완전한 API 문서 제공

### Test Runner 성공 기준
- 테스트 커버리지 80% 이상
- 모든 E2E 테스트 통과
- CI/CD 파이프라인 구축

### Performance Benchmarker 성공 기준
- Core Web Vitals 모든 기준 달성
- 데이터베이스 쿼리 최적화 완료
- 성능 모니터링 시스템 구축